---
title: Vetted - a new project
layout: post
category: Software/Tech
---

When I was in high school, I created a fairly basic application for managing a
small veterinary practice. It's written in Microsoft Access and is used by my
parents to manage their mobile veterinary business.

I'm toying with rebuilding it as a web application. For its current users, the
main benefits of this would be:

1. client contact details could be made available on a mobile device;
2. there will be no more (or at least fewer) issues with concurrent
   modification (merging two access database files that have been modified
   independently on different computers because Dropbox didn't sync is no fun);
   and
3. it will be accessible anywhere with internet access, so that my dad could do
   accounts when he is away from home and has some downtime.

For me, it would mainly be a learning opportunity.

Naming things is not my strong suit, so I'm going with 'Vetted' for now.

I'm going to try to do the following throughout the project:

* Apply domain driven design rigorously
* Apply functional programming principles
* Document failures and successes
* Document my [design heuristics](#design-heuristics)
* [Develop in the open](#develop-in-the-open)
* Deploy continuously to ~~production~~ *somewhere*
* Focus on adding the most valuable parts first (e.g. make phone numbers
  available online) & delivering vertical slices

I'm thinking that the basic architecture for now will be:

* Single page application
* Elm frontend
* Kotlin backend
* Maybe some kind of event sourced data store, as I'd like to see how badly I
  can shoot my foot off

While I want to build something functional, I also want to learn about a few
techniques/patterns/tools that would be applicable on larger projects, so I might
be making some choices which seems strange. I'll try to call these out as they
happen. I need to remember that [I am not Google][unphat].

I'm hoping to publish posts more regularly about this project, so keep an eye
out if you're interested!

------

## Notes

### Design Heuristics

I attended the excellent [Explore DDD conference](http://exploreddd.com/) this
year and one of my favourite talks was [Cultivating Your Design
Heuristics][heuristics-talk] by Rebecca Wirfs-Brock.

As defined in the talk, a heuristic is:

> anything that provides a plausible aid (not a guaranteed aid) or direction in
> defining a solution but is ultimately irrelevant to the final product

Rebecca encourages everyone to consciously document and cultivate heuristics,
learn others heuristics & discuss them and ultimately adapt (or wholesale
replace) your own heuristics when appropriate.

It's a great talk, and I'm going to try to document the heuristics that I find
myself using while working on this project.

### Develop in the open

I'm going to be writing about what I'm building, and the code will be available
on GitHub. However, I haven't yet determined how to license the project. My
basic requirement is that I retain copyright and can relicense the project if
that's ever required.

Look out for a post on this in the near future.

[unphat]: https://blog.bradfieldcs.com/you-are-not-google-84912cf44afb
[heuristics-talk]: https://www.youtube.com/watch?v=fWCt5KWfTuo
