---
title: SICP Quotes
permalink: /SICPQuotes/
layout: page
---

A while ago I started reading Structure and Interpretation of Computer Programs
by Harold Abelson & Gerald Jay Sussman. It was the most quotable programming
book I've read in a while, so I started making notes and then decided to start
tweeting them under [@SICPQuotes](https://twitter.com/SICPQuotes).

Some editions of the book are freely available (I've been reading from
[http://sarabander.github.io/sicp/](http://sarabander.github.io/sicp/)) or if
you prefer to have something to hold you can purchase from
[Amazon](http://www.amazon.com/Structure-Interpretation-Computer-Programs-Engineering/dp/0262510871).

Below are the full excerpts for the tweets so far, as the tweets are often
heavily abbreviated. I don't update this page regularly though, so expect a bit
of a delay between the tweet and the full excerpt appearing.

* To appreciate programming as an intellectual activity in its own right you
  must turn to computer programming; you must read and write computer programs
  — many of them.
* The programmer must seek both perfection of part and adequacy of collection.
* For all its power, the computer is a harsh taskmaster. Its programs must be
  correct, and what we wish to say must be said accurately in every detail.
* Every computer program is a model, hatched in the mind, of a real or mental
  process. These processes, arising from human experience and thought, are huge
  in number, intricate in detail, and at any time only partially understood. They
  are modeled to our permanent satisfaction rarely by our computer programs.
* The source of the exhilaration associated with computer programming is the
  continual unfolding within the mind and on the computer of mechanisms
  expressed as programs and the explosion of perception they generate.
* Unfortunately, as programs get large and complicated, as they almost always
  do, the adequacy, consistency, and correctness of the specifications
  themselves become open to doubt, so that complete formal arguments of
  correctness seldom accompany large programs
* The processes that transform our Lisp programs to "machine" programs are
  themselves abstract models which we program.
* The computers are never large enough or fast enough. Each breakthrough in
  hardware technology leads to more massive programming enterprises, new
  organizational principles, and an enrichment of abstract models.
* Every reader should ask himself periodically “Toward what end, toward what
  end?” — but do not ask it too often lest you pass up the fun of programming
  for the constipation of bittersweet philosophy.
* It is better to have 100 functions operate on one data structure than to have
  10 functions operate on 10 data structures.
* The critical programming concerns of software engineering and artificial
  intelligence tend to coalesce as the systems under investigation become
  larger
* Invent and fit; have fits and reinvent! We toast the Lisp programmer who pens
  his thoughts within nests of parentheses.
* It is not merely a matter of tactical convenience to separately identify the
  three foci. Even though, as they say, it’s all in the head, this logical
  separation induces an acceleration of symbolic traffic between these foci whose
  richness, vitality, and potential is exceeded in human experience only by the
  evolution of life itself.
* Mathematics provides a framework for dealing precisely with notions of "what
  is." Computation provides a framework for dealing precisely with notions of
  "how to".
* First, we want to establish the idea that a computer language is not just a
  way of getting a computer to perform operations but rather that it is a novel
  formal medium for expressing ideas about methodology.
* Programs must be written for people to read, and only incidentally for
  machines to execute
* Computational processes are abstract beings that inhabit computers. As they
  evolve, processes manipulate other abstract things called data. The evolution
  of a process is directed by a pattern of rules called a program. People create
  programs to direct processes. In effect, we conjure the spirits of the computer
  with our spells.
* The programs we use to conjure processes are like a sorcerer’s spells. They
  are carefully composed from symbolic expressions in arcane and esoteric
  programming languages
* It is possible, indeed important, to be able to separate these two notions—to
  create procedures without naming them, and to give names to procedures that
  have already been created.
* It is crucial that each procedure accomplishes an identifiable task that can
  be used as a module in defining other procedures
* A user should not need to know how the procedure is implemented in order to
  use it.
* In describing a procedure as recursive, we are referring to the syntactic
  fact that the procedure definition refers to the procedure itself.
* It may seem disturbing that we refer to a certain recursive procedures as
  generating iterative processes.
* One of the things we should demand from a powerful programming language is
  the ability to build abstractions by assigning names to common patterns and
  then to work in terms of the abstractions directly.
* As programmers, we should be alert to opportunities to identify the
  underlying abstractions in our programs and to build upon them and generalize
  them to create more powerful abstractions
* Expert programmers know how to choose the level of abstraction appropriate to
  their task
* "We now come to the decisive step of mathematical abstraction: we forget
  about what the symbols stand for. ... [The mathematician] need not be idle;
  there are many operations which he may carry out with these symbols, without
  ever having to look at the things they stand for."
* Higher-order procedures enhance the power of our language by enabling us to
  manipulate, and thereby to reason in terms of, general methods of
  computation. This is much of the essence of programming.
* More often than not one must construct computational objects that have
  several parts in order to model real-world phenomena that have several
  aspects.
* Why do we want compound data in a programming language? For the same reasons
  that we want compound procedures: to elevate the conceptual level at which we
  can design our programs, to increase the modularity of our designs, and to
  enhance the expressive power of our language
* We will discover how to form compound data using no special "data" operations
  at all, only procedures. This will further blur the distinction between
  "procedure" and "data," which was already becoming tenuous.
* Our programs should use data in such a way as to make no assumptions about
  the data that are not strictly necessary for performing the task at hand.
* We are using here a powerful strategy of synthesis: wishful thinking.
* In general, the underlying idea of data abstraction is to identify for each
  type of data object a basic set of operations in terms of which all
  manipulations of data objects of that type will be expressed
* In general, we can think of data as defined by some collection of selectors
  and constructors, together with specified conditions that these procedures
  must fulfill in order to be a valid representation.
* The point of exhibiting the procedural representation of pairs is not that
  our language works this way (Scheme, and Lisp systems in general, implement
  pairs directly, for efficiency reasons) but that it could work this way.
* Procedural representations of data will play a central role in our
  programming repertoire.
* The ability to manipulate procedures as objects automatically provides the
  ability to represent compound data.
* An operation for combining data objects satisfies the closure property if the
  results of combining things with that operation can themselves be combined
  using the same operation.
* Closure is the key to power in any means of combination because it permits us
  to create hierarchical structures
* All but the very simplest programs rely on the fact that the elements of a
  combination can themselves be combinations.
* The word nil is a contraction of the Latin word nihil, which means "nothing."
* Other dialects of Lisp, including Common Lisp, treat nil as a special symbol.
  The authors of this book, who have endured too many language standardization
  brawls, would like to avoid the entire issue.
* In effect, map helps establish an abstraction barrier that isolates the
  implementation of procedures that transform lists from the details of how the
  elements of the list are extracted and combined.
* The representation of sequences in terms of lists generalizes naturally to
  represent sequences whose elements may themselves be sequences.
* The value of expressing programs as sequence operations is that this helps us
  make program designs that are modular, that is, designs that are constructed
  by combining relatively independent pieces
* We can encourage modular design by providing a library of standard components
  together with a conventional interface for connecting the components in
  flexible ways.
* Modular construction is a powerful strategy for controlling complexity in
  engineering design.
* Sequence operations provide a library of standard program elements that we
  can mix and match.
* This is the approach of stratified design, the notion that a complex system
  should be structured as a sequence of levels that are described using a
  sequence of languages.
* Each level is constructed by combining parts that are regarded as primitive
  at that level, and the parts constructed at each level are used as primitives
  at the next level.
* The language used at each level of a stratified design has primitives, means
  of combination, and means of abstraction appropriate to that level of detail.
* Stratified design helps make programs robust, that is, it makes it likely
  that small changes in a specification will require correspondingly small
  changes in the program.
* Each level of a stratified design provides a different vocabulary for
  expressing the characteristics of the system, and a different kind of ability
  to change it.
* We can obtain the empty list by evaluating `'()`, and thus dispense with the
  variable nil.
* Symbolic differentiation is of special historical significance in Lisp. It
  was one of the motivating examples behind the development of a computer
  language for symbol manipulation.
* Only afterward will we address the representation problem.
* So in addition to the data-abstraction barriers that isolate representation
  from use, we need abstraction barriers that isolate different design choices
  from each other and permit different choices to coexist in a single program.
* We need conventions that permit programmers to incorporate modules into
  larger systems additively, that is, without having to redesign or reimplement
  these modules.
* One way to view data abstraction is as an application of the "principle of
  least commitment."
* This discipline of stripping off and attaching tags as data objects are
  passed from level to level can be an important organizational strategy
* The general strategy of checking the type of a datum and calling an
  appropriate procedure is called dispatching on type.
* What we need is a means for modularizing the system design even further. This
  is provided by the programming technique known as data-directed programming.
* One strategy is to decompose the table into columns and, instead of using
  "intelligent operations" that dispatch on data types, to work with
  "intelligent data objects" that dispatch on operation names.
* This style of programming is called message passing. The name comes from the
  image that a data object is an entity that receives the requested operation
  name as a "message."
* Often the different data types are not completely independent, and there may
  be ways by which objects of one type may be viewed as being of another type.
  This process is called coercion.
* If the data types in our system can be naturally arranged in a tower, this
  greatly simplifies the problems of dealing with generic operations on
  different types, as we have seen. Unfortunately, this is usually not the case.
* The main difference between the confusion that existed ten years ago and the
  confusion that exists now is that now a variety of inadequate ontological
  theories have been embodied in a plethora of correspondingly inadequate
  programming languages.
* The tower strategy is certainly not natural for this domain or for any domain
  where the user can invent new types dynamically using old types in various
  combining forms, such as trigonometric functions, power series, and integrals.
* Indeed, it is fair to say that we do not yet completely understand coercion.
  In fact, we do not yet completely understand the concept of a data type.
* Much of the complexity of object-oriented programming languages -- and the
  subtle and confusing differences among contemporary object-oriented languages
  -- centers on the treatment of generic operations on interrelated types.
* Effective program synthesis also requires organizational principles that can
  guide us in formulating the overall design of a program.
* To a large extent, then, the way we organize a large program is dictated by
  our perception of the system to be modelled.
* Both the object-based approach and the stream-processing approach raise
  significant linguistic issues in programming.
* With objects, we must be concerned with how a computational object can change
  and yet maintain its identity.
* The difficulties of dealing with objects, change, and identity are a
  fundamental consequence of the need to grapple with time in our computational
  models.
* The stream approach can be most fully exploited when we decouple simulated
  time in our model from the order of the events that take place in the
  computer during evaluation. We will accomplish this using a technique known as
  delayed evaluation.
* An object is said to "have state" if its behavior is influenced by its
  history.
* We can characterize an object's state by one or more state variables, which
  among them maintain enough information about history to determine the
  object's current behavior.
* The view that a system is composed of separate objects is most useful when
  the state variables of the system can be grouped into closely coupled
  subsystems that are only loosely coupled to other subsystems.i
* For such a model to be modular, it should be decomposed into computational
  objects that model the actual objects in the system.
* If we wish to model state variables by ordinary symbolic names in the
  programming language, then the language must provide an assignment operator
  to enable us to change the value associated with a name.
* Observe that the expression `(withdraw 25)`, evaluated twice, yields
  different values. This is a new kind of behavior for a procedure. Until now,
  all our procedures could be viewed as specifications for computing mathematical
  functions.
* Encapsulation reflects the general system-design principle known as the
  hiding principle: One can make a system more modular and robust by protecting
  parts of the system from each other.
* The trouble is that, as soon as we introduce assignment into our language,
  substitution is no longer an adequate model of procedure application.
* As we shall see, introducing assignment into our programming language leads
  us into a thicket of difficult conceptual issues. Nevertheless, viewing
  systems as collections of objects with local state is a powerful technique for
  maintaining a modular design.
* The phenomenon illustrated by the Monte Carlo example is this: From the point
  of view of one part of a complex process, the other parts appear to change
  with time. They have hidden time-varying local state.
* It is tempting to conclude this discussion by saying that, by introducing
  assignment and the technique of hiding state in local variables, we are able
  to structure systems in a more modular fashion than if all state had to be
  manipulated explicitly, by passing additional parameters. Unfortunately, as we
  shall see, the story is not so simple.
* No simple model with "nice" mathematical properties can be an adequate
  framework for dealing with objects and assignment in programming languages.
* Programming without any use of assignments, as we did throughout the first
  two chapters of this book, is accordingly known as functional programming.
* But as soon as we introduce `set!` and the idea that the value of a variable
  can change, a variable can no longer be simply a name.
* As soon as we introduce change into our computational models, many notions
  that were previously straightforward become problematical.
* A language that supports the concept that "equals can be substituted for
  equals" in an expresssion without changing the value of the expression is
  said to be referentially transparent.
* Once we forgo referential transparency, the notion of what it means for
  computational objects to be "the same" becomes difficult to capture in a
  formal way.
* Indeed, the meaning of "same" in the real world that our programs model is
  hardly clear in itself.
* The phenomenon of a single computational object being accessed by more than
  one name is known as aliasing.
* Bugs can occur in our programs if we forget that a change to an object may
  also, as a "side effect," change a "different" object because the two
  "different" objects are actually a single object appearing under different
  aliases.
* In general, so long as we never modify data objects, we can regard a compound
  data object to be precisely the totality of its pieces.
* In contrast to functional programming, programming that makes extensive use
  of assignment is known as imperative programming.
* Programs written in imperative style are susceptible to bugs that cannot
  occur in functional programs.
* In view of this, it is ironic that introductory programming is most often
  taught in a highly imperative style.
* Whatever the reason, it often saddles beginning programmers with "should I
  set this variable before or after that one" concerns that can complicate
  programming and obscure the important ideas.
* The complexity of imperative programs becomes even worse if we consider
  applications in which several processes execute concurrently.
