---
title: Simon Peyton Jones on maintenance with strong types
layout: post
categories:
  - Uncategorized
---

> People don’t like fixing type errors, but they are a lot easier to fix than runtime errors… The single biggest thing going for static typing is not so much that it helps you write your program in the first place, but it helps you maintain your program.
> 
> GHC itself is an example – it’s now 150,000 lines of Haskell & twenty years old and I regularly refactor it in pretty large scale ways. I just wouldn’t dare do that if I didn’t have static typing to keep me sane. It’s this enormous code base, chunks of which I’ve forgotten about, and yet I can confidently make systemic changes to it because I know the type checker is going to catch all the places that change needs to go.

Simon Peyton Jones, speaking on [Functional Geekery Episode 11][1].

The part about GHC is anecdotal evidence, to be sure, but it makes the point nicely.

 [1]: http://www.functionalgeekery.com/episode-11-simon-peyton-jones/ "Functional Geekery Episode 11 – Simon Peyton Jones"