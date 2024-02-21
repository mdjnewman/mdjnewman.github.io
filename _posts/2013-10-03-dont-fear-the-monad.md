---
title: 'Don’t fear the Monad'
layout: post
category: Software/Tech
---

I recently watched Brian Beckman’s [Don't fear the monad](http://channel9.msdn.com/shows/Going+Deep/Brian-Beckman-Dont-fear-the-Monads/) talk (YouTube version [here](http://www.youtube.com/watch?v=ZhuHCtR3xq8)) and thought it was a really good explanation of functions, monoids & monads and why they’re a useful way to master complexity.

I recommend it to anyone who’s starting to look at functional programming. Here are some of the key points I took away from the talk:

  * Functions are data 
      * A function takes an argument(/s) and returns a value, and always returns the same result for the same inputs
      * Think of a function as a table lookup – the table is the data
  * Functional programming is a style that can be used in almost any language 
      * But some languages make it easier than others
      * First class functions (or at least lamdbas) are a must have
  * Complexity is killing software developers – we need to control it 
      * The best way to control complexity is to put functions into groups where things are disciplined, and where they can be composed in arbitrary ways
      * Build complexity out of simplicity by composing things
  * A monad adds some data to a value, and the implementation of the bind operator defines how that data interacts
  * If you want to add a feature, you shouldn’t even have to know what you’re going to interact with 
      * Using monads means the interaction is already built into the structure
  * You don’t need to know what a monad does
      * So long as it follows the rules, it can have arbitrary side effects

Another interesting part was Brian’s reasoning about why functional programming is a ‘hard sell’:

> Immediately upon the foundation of computing, the world split into two camps – the bottom up camp and the top down camp.
> 
> The bottom up camp is typified by Turing machines – “let’s start with the hardware and add abstraction as we need it to get close to the mathematics, but never at the expense of performance”. That gave rise to FORTRAN, C, C++, Pascal, Java, C# … all of those languages are in that tradition.
> 
> The top down crowd says “let’s start with the mathematics and subtract abstractions to get down to the machine, sometimes at the expense of performance”. That tradition starts with lambda calculus … and only subtracts abstraction when it is convenient to do so. That’s the tradition that gave rise to ALGOL, Lisp, Smalltalk, ML, Haskell and all these languages that have reputations of being slow.

As most programmers are familiar with the bottom up way of doing things and the two approaches come from very different origins, it can be hard to convince a bottom up programmer of the benefits of the ‘top down’ approach. It can be even harder to pick up functional programming once you’ve resigned to giving it a try.

> [The top-down crowd] are saying “don’t go to the hardware so early, you’ll lock yourself into irreversible design choices”. [The bottom-up crowd] are saying “don’t give me all this math, I can’t handle garbage collection, or function calls or whatever it is that’s getting in the way of my performance, I need every ounce of performance the hardware can give me. And I’m willing to write software into the wee hours of the morning to get it”.

The last sentence here is what stands out to me – as software gets more complex, it seems that bottom up programming is going to require more and more time working in the wee hours of the morning to get the desired performance and functionality.
