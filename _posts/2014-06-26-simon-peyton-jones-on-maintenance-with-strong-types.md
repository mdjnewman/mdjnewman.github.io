---
title: Simon Peyton Jones on maintenance with strong types
author: mdjnewman
layout: post
permalink: /2014/06/simon-peyton-jones-on-maintenance-with-strong-types/
categories:
  - Uncategorized
format: quote
---
> People don&#8217;t like fixing type errors, but they are a lot easier to fix than runtime errors&#8230; The single biggest thing going for static typing is not so much that it helps you write your program in the first place, but it helps you maintain your program.
> 
> GHC itself is an example &#8211; it&#8217;s now 150,000 lines of Haskell & twenty years old and I regularly refactor it in pretty large scale ways. I just wouldn&#8217;t dare do that if I didn&#8217;t have static typing to keep me sane. It&#8217;s this enormous code base, chunks of which I&#8217;ve forgotten about, and yet I can confidently make systemic changes to it because I know the type checker is going to catch all the places that change needs to go.

Simon Peyton Jones, speaking on [Functional Geekery Episode 11][1].

The part about GHC is anecdotal evidence, to be sure, but it makes the point nicely.

 [1]: http://www.functionalgeekery.com/episode-11-simon-peyton-jones/ "Functional Geekery Episode 11 – Simon Peyton Jones"