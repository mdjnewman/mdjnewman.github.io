---
title: Vetted - tweaking importer performance
layout: post
---

Since the [last post](/2018/01/vetted-importing-data/), I've started working on
an importer to load data from the existing Access database. Work to date is on
[GitHub](https://github.com/mdjnewman/vetted/tree/f1253732f1c2e582fd6412a45aa75a133fa8bb78).

In the current domain model, there is a single aggregate root, the `Client`.
The importer is written as a command line application which interacts directly
with the domain, assuming an empty database (I might get to incremental imports
in the future). At a high level, the importer currently:

* Creates the clients
* Adds any existing 'notes' about the client
    * Notes are freeform text about a client, unrelated to any particular patient or
      transaction
    * The existing application is a little limited in what can be entered into
      the main form, so notes have been used to make up the slack (e.g.
      existing data, there are numerous clients which have an email address or fax
      number in the notes field, as there is no first class input for these values)
* Adds home and mobile phone numbers
* Adds the 'most common travel distance' as a note

These steps are clearly visible in the implementation of the importer:

```kotlin
override fun run(vararg args: String?) {
    val rows = accessDb.clientTableRows

    val newClientIds: Map<String, UUID> = createClients(
        rows,
        accessDb::postCodeFor,
        accessDb::stateFor,
        commandGateway
    )

    allOf(
        addClientNotes(rows, newClientIds, commandGateway),
        addPhoneNumbers(rows, newClientIds, commandGateway),
        addMostCommonDistance(rows, newClientIds, commandGateway)
    ).get()
}
```

First, clients are created, producing a `Map` of the old client ID to the new
client ID. Once all clients have been created, all the other updates are
applied (potentially concurrently).

Without giving away too much information about the existing data, the [order of
magnitude][o-of-m] of the existing number of clients is 3, and the total number
of events generated with the current importer implementation is at most 5x the
number of clients (one `ClientMigratedEvent`, up to two `ClientNoteAddedEvent`s
and up to two `ClientPhoneNumberAddedEvent`s).

My first pass at the importer was taking around 80 seconds to import everything
into a PostgreSQL database. I know that [premature optimization is the root of
all evil][prem-optimisation], and that I don't have anything resembling a
working product at the moment, but this seemed far too high. Also, it was
impacting my ability to iterate quickly with 'production' data, which is enough
of a reason to look for improvements.

After looking at the generated schema and doing some sampling with
[VisualVM][visualvm], I decided there were three options to investigate:

* Asynchronous processing of commands
* Serialisation format changes
* Generated schema changes

The first three really fall into infrastructure type changes, whereas the last
requires a refactoring of the application code.

In order to compare a full run of the importer pre and post optimisations, I
want to be able to toggle the optimisations on/off from the command line. The
following script has the toggle properties in place, and in the sections below I
will use Spring config management to read these properties.

```
PASSWORD=$(uuidgen)

docker run \
    --publish 5432:5432/tcp \
    --name some-postgres \
    --env POSTGRES_PASSWORD=$PASSWORD \
    --detach \
    postgres

./gradlew build

java \
    -jar importer/build/libs/vetted-importer-0.0.1-SNAPSHOT.jar \
    --axon.use-async-command-bus=false \
    --axon.use-cbor-serializer=false \
    --spring.jpa.database-platform=org.hibernate.dialect.PostgreSQL95Dialect \
    --spring.datasource.password=$PASSWORD
```

The script above will allow me to evaluate the impact of any changes I make in
a repeatable fashion.

## Option 1 - Asynchronous processing of commands

I'm using the [Axon framework][axon], which handles a lot of the plumbing of
building an application based on DDD & CQRS principles. By default when using
the Spring autoconfiguration, a [`SimpleCommandBus`][simplecommandbus] is used
which processes commands on the calling thread.

I added some configuration to use a [`AsynchronousCommandBus`][asynchronouscommandbus]
with a configurable number of threads:

```
@Bean
@ConditionalOnProperty(
    value = ["axon.use-async-command-bus"],
    matchIfMissing = true
)
fun bus(
    transactionManager: TransactionManager,
    @Value("\${axon.command-bus.executor.pool-size}") poolSize: Int
): CommandBus {
    val bus = AsynchronousCommandBus(
        Executors.newFixedThreadPool(poolSize)
    )

    val tmi = TransactionManagingInterceptor(transactionManager)
    bus.registerHandlerInterceptor(tmi)

    return bus
}
```

I initially tried this configuration out with a pool size of 10. This reduced
the time for the import to around 30 seconds, which is an improvement from 80
seconds but short of an order of magnitude improvement which should be
possible. This led me to believe that there was either contention somewhere
else, or that some of the constant factors are just too high at the moment.

## Option 2 - Serialisation format changes

By default, Axon will use [XStream](https://x-stream.github.io/) to serialise
events, which uses an XML representation. XML is quite verbose, and the [Axon
documentation][different-serializer-for-events] even suggests using a different
serializer.

Overriding the serializer is thankfully quite easy:

```kotlin
@Primary
@Bean
@ConditionalOnProperty(
    value = ["axon.use-cbor-serializer"],
    matchIfMissing = true
)
fun serializer(): Serializer {
    val objectMapper = ObjectMapper(CBORFactory())
    objectMapper.findAndRegisterModules()
    objectMapper.setSerializationInclusion(NON_ABSENT)
    return JacksonSerializer(objectMapper)
}
```

I opted for using [Jackson][jackson] with a 'Concise Binary Object
Representation' (CBOR) `JsonFactory`. This resulted in a ~70% reduction in size
for the serialized payload for most events. With XML:

```
postgres=# select avg(length(loread(lo_open(payload::int, x'40000'::int), x'40000'::int))) from domain_event_entry;
     avg
--------------
 433.69003053
```

and with CBOR:

```
     avg
--------------
 111.54379774
```

This didn't have a huge impact on the run time of the importer, but is still a
worthwhile optimisation.

## Option 3 - Generated schema changes

You may have noticed in the SQL statments above that the current schema is
using the PostgreSQL [large objects][psql-lo] functionality. From the
PostgreSQL docs:

> PostgreSQL has a large object facility, which provides stream-style access
> to user data that is stored in a special large-object structure. Streaming
> access is useful when working with data values that are too large to
> manipulate conveniently as a whole.

If we inspect the schema that's being generated:

```
postgres=# \d domain_event_entry
     Table "public.domain_event_entry"
      Column      | Type | Nullable | Default
------------------+------+----------+---------
 meta_data        | oid  |          |
 payload          | oid  | not null |
 ...
```

The `oid` type here is a **o**bject **id**entifier - a reference to a large
object which is stored externally from the table. The events we're writing are
small enough that the overhead of reading them as separate streams is hurting
performance rather than helping.

At least two people have had the same issue as me when using Axon with
PostgreSQL, as evidenced by the questions on [Google
Groups][postgres-plus-axon] and [StackOverflow][jpa-lob-issue]. The suggestion
to customise the PostgreSQL dialect used by Hibernate seems to work, and
further reduced the runtime to around 8 seconds.

# Conclusion

The three changes above have reduced the run time of the importer from around
80 seconds to around 8 seconds, based on my very rough benchmarking. The code
is all at the link above, and the optimisations are on by default.

There is surely more that can be done, to improve performance, but that's fast
enough for now!

[o-of-m]: https://en.wikipedia.org/wiki/Order_of_magnitude
[prem-optimisation]: http://wiki.c2.com/?PrematureOptimization
[visualvm]: https://visualvm.github.io/
[axon]: http://www.axonframework.org/
[simplecommandbus]: https://github.com/AxonFramework/AxonFramework/blob/master/core/src/main/java/org/axonframework/commandhandling/SimpleCommandBus.java
[asynchronouscommandbus]: https://github.com/AxonFramework/AxonFramework/blob/master/core/src/main/java/org/axonframework/commandhandling/AsynchronousCommandBus.java
[different-serializer-for-events]: https://docs.axonframework.org/part4/performance-tuning.html#different-serializer-for-events
[jackson]: https://github.com/FasterXML/jackson

[psql-lo]: https://www.postgresql.org/docs/10/static/largeobjects.html
[axon-postgresql-without-toast]: https://blog.trifork.com/2017/10/09/axon-postgresql-without-toast/
[postgres-plus-axon]: https://groups.google.com/forum/#!msg/axonframework/PfzLa3hBR0Y/nsie2H8kPP8J
[jpa-lob-issue]: https://github.com/AxonFramework/AxonFramework/issues/445