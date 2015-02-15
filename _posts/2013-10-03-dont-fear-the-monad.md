---
title: 'Don&#8217;t fear the Monad'
author: mdjnewman
layout: post
permalink: /2013/10/dont-fear-the-monad/
dsq_thread_id:
  - 3471703437
categories:
  - Functional programming
---
<span style="line-height: 1.5;">I recently watched Brian Beckman&#8217;s </span><a style="line-height: 1.5;" title="Brian Beckman: Don't fear the Monad" href="http://channel9.msdn.com/shows/Going+Deep/Brian-Beckman-Dont-fear-the-Monads/">Don&#8217;t fear the Monad</a><span style="line-height: 1.5;"> talk (YouTube version <a title="Brian Beckman: Don't fear the Monad (YouTube)" href="http://www.youtube.com/watch?v=ZhuHCtR3xq8">here</a>) and thought it was a really good explanation of functions, monoids & monads and why they&#8217;re a useful way to master complexity.</span>

I recommend it to anyone who&#8217;s starting to look at functional programming. Here are some of the key points I took away from the talk:

  * Functions are data 
      * A function takes an argument(/s) and returns a value, and always returns the same result for the same inputs
      * Think of a function as a table lookup &#8211; the table is the data
  * Functional programming is a style that can be used in almost any language 
      * But some languages make it easier than others
      * First class functions (or at least lamdbas) are a must have
  * <span style="line-height: 1.5;">Complexity is killing software developers &#8211; we need to control it</span> 
      * <span style="line-height: 1.5;">The best way to control complexity is to put functions into groups where things are disciplined, and where they can be composed in arbitrary ways</span>
      * Build complexity out of simplicity by composing things
  * A monad adds some data to a value, and the implementation of the bind operator defines how that data interacts
  * <span style="line-height: 1.5;">If you want to add a feature, you shouldn&#8217;t even have to know what you&#8217;re going to interact with</span> 
      * Using monads means the interaction is already built into the structure
  * You don&#8217;t need to know what a monad does 
      * <span style="line-height: 1.5;">So long as it follows the rules, it can have arbitrary side effects</span>

Another interesting part was Brian&#8217;s reasoning about why functional programming is a &#8216;hard sell':

> Immediately upon the foundation of computing, the world split into two camps &#8211; the bottom up camp and the top down camp.
> 
> The bottom up camp is typified by Turing machines &#8211; &#8220;let&#8217;s start with the hardware and add abstraction as we need it to get close to the mathematics, but never at the expense of performance&#8221;. That gave rise to FORTRAN, C, C++, Pascal, Java, C# &#8230; all of those languages are in that tradition.
> 
> The top down crowd says &#8220;let&#8217;s start with the mathematics and subtract abstractions to get down to the machine, sometimes at the expense of performance&#8221;. That tradition starts with lambda calculus &#8230; and only subtracts abstraction when it is convenient to do so. That&#8217;s the tradition that gave rise to ALGOL, Lisp, Smalltalk, ML, Haskell and all these languages that have reputations of being slow.

As most programmers are familiar with the bottom up way of doing things and the two approaches come from very different origins, it can be hard to convince a bottom up programmer of the benefits of the &#8216;top down&#8217; approach. It can be even harder to pick up functional programming once you&#8217;ve resigned to giving it a try.

> [The top-down crowd] are saying &#8220;don&#8217;t go to the hardware so early, you&#8217;ll lock yourself into irreversible design choices&#8221;. [The bottom-up crowd] are saying &#8220;don&#8217;t give me all this math, I can&#8217;t handle garbage collection, or function calls or whatever it is that&#8217;s getting in the way of my performance, I need every ounce of performance the hardware can give me. And I&#8217;m willing to write software into the wee hours of the morning to get it&#8221;.

The last sentence here is what stands out to me &#8211; as software gets more complex, it seems that bottom up programming is going to require more and more time working in the wee hours of the morning to get the desired performance and functionality.