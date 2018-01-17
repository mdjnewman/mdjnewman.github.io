---
title: Vetted - importing data into an event sourced system
layout: post
---

*See [Vetted - a new project][vetted-a-new-hope] for some background.*

A task I'm going to have to tackle sooner or later is importing data from the
existing Access database. As I'm going to try my hand at event sourcing, this raises and interesting question:

> Given an existing application with data stored in an relational database & no notion of events, how do you go about importing data into an event sourced system?

At a high level, the initial options seem to be:

* Try to reverse engineer/map the existing state to events
* Have some sort of migration event event in your domain model (e.g. `FooMigrated`)
* Import the initial data and treat it as a snapshot (i.e. an aggregation of past events)
* Run everything through your new API as commands, and allow the API implementation to take care of creating the relevant events like normal

[vetted-a-new-hope]: /2017/11/vetted-a-new-hope/
[gg-importing-historic-data-into-an-event-store]: https://groups.google.com/forum/#!topic/dddcqrs/xUbKn8YLJfk
[so-importing-data-and-event-sourcing]: https://stackoverflow.com/questions/43640256/importing-data-and-event-sourcing
[mf-event-sourcing]: https://martinfowler.com/eaaDev/EventSourcing.html
