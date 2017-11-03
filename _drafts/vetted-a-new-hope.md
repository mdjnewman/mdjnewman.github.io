---
title: Vetted - a new project
layout: post
---

When I was in high school, I created what is in hindsight a fairly basic
application for managing a small veterinary practice. It's written in Microsoft
Access and is used by parents to manage their mobile veterinary business.

For a while I've toyed with rebuilding it as a web application. For its current
users, the main benefits of this would be 1) contacts/patient details could be
made available on a mobile device, 2) there are no more issues with concurrent
modification (merging two access database files that have been modified
independently on different computers because Dropbox didn't sync is no fun) and
3) it's accessible anywhere, so that my dad could do accounts when he is away
from home and has some downtime.

For me, it would mainly be a learning opportunity. Maybe I will build something
useful enough that other small veterinary practices would find it useful, but
that's not really the goal at the moment.

I'm going to try to do the following throughout the project:

* Apply domain driven design rigorously
* Apply functional programming principles
* Document failures and successes
* Document my [design heuristics](#design-heuristics)
* [Develop in the open](#develop-in-the-open)
* Deploy continuously to ~~production~~ *somewhere*
* Focus on adding the valuable parts first (contacts for example) & delivering
  vertical slices

I'm thinking that the basic architecture for now will be:

* Single page application
* Elm frontend
* Kotlin backend
* Maybe some kind of event sourced data store, as I'd like to see how badly I
  can shoot my foot off

I'm hoping to publish posts more regularly about this project, so

------

## Design Heuristics

## Develop in the open