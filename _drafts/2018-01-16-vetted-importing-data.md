---
title: Vetted - importing data into an event sourced system
layout: post
---

*See [Vetted - a new project][vetted-a-new-hope] for some background.*

A task I'm going to have to tackle sooner or later is importing data from the
existing Access database. As I'm going to try my hand at event sourcing, this
raises and interesting question:

> Given an existing application with data stored in an relational database & no
> notion of events, how do you go about importing data into an event sourced
> system?

Options
-------

At a high level, the initial options seem to be:

1. Try to reverse engineer/map the existing state to events
2. Have some sort of migration event event in your domain model (e.g.
   `FooMigrated`) which acts as a snapshot
3. Run everything through your new API as commands, and allow the API
   implementation to take care of creating the relevant events like normal

### 'Recreating' domain events

Option one above would be nice, but seems impractical at best and is more likely
impossible. For every domain object (client, patient, payment, invoice,
vaccination etc) I'd need to try and reverse engineer the real-world happenings
that occurred to transition the object into its current state.

### A 'migration event' as a snapshot

Originally when a colleague suggested this it conflicted with my understanding
of the term 'snapshot'. To me a 'snapshot' has always been about collapsing an
event stream into a single event for performance reasons. When using this kind
of snapshot, the original stream of events is still available.

The second kind of snapshot (which I didn't see immediately) is a snapshot
which is used as base data. When using a snapshot as base data, the collapsed
state of the aggregate at the time the snapshot is all the information you have
about the history of the aggregate.

It could also be argued that the migration is a meaningful domain event in its
own right, and should be captured explicitly. A `CustomerMigratedEvent` could
result in the creation of a new customer aggregate root in the same way that a
`CustomerRegisteredEvent` does.

### Run all existing data through the new API

It should be possible to write a script that reads data from the existing
database, creates commands and posts those to the appropriate API. The relevant
events would ultimately be created off the back of processing the commands, so
all 'legacy' data should look exactly the same as anything created going
forward.

The outcome is probably close to option one above, but with less manual work.

Next steps
----------

So far I've been spending a lot of time on the technical concepts & design of
an event sourced system, without doing much on the implementation side.

It's hard to build a useful conceptual domain model without considering
implementation issues, so I think it's time I stopped debating concepts and
wrote some code.

I'm planning to explore a little and gain an understanding of how building and
executing commands would differ in practice from the 'import event' option
above.


---

Further Reading
---------------

* [Importing historic data into an Event Store][gg-importing-historic-data] on the DDD/CQRS Google Group
* [Importing data and Event Sourcing][so-importing-data-and-event-sourcing] on Stack Overflow
* [Event Sourcing][mf-event-sourcing] on martinfowler.com

[vetted-a-new-hope]: /2017/11/vetted-a-new-hope/
[gg-importing-historic-data]: https://groups.google.com/forum/#!topic/dddcqrs/xUbKn8YLJfk
[so-importing-data-and-event-sourcing]: https://stackoverflow.com/questions/43640256/importing-data-and-event-sourcing
[mf-event-sourcing]: https://martinfowler.com/eaaDev/EventSourcing.html
