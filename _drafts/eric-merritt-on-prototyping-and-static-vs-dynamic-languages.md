http://www.functionalgeekery.com/episode-20-eric-b-merritt/

> I suspect, and this is just me guessing, that that comes really from this
> idea that we have in the programming community that statically typed systems
> are bad for exploration or for doing things where you don't really know the
> full extent of what it is you have to do. We draw a line a lot in our heads
> where we say dynamically typed systems (like Ruby and Python) are better for
> exploratory programming and Ocaml, SML, Haskell are better for well-known
> problems.

> I think that's probably this idea that dynamic typing is looser and looser
> means less coupling is where that comes from. My position is that's a load of
> crap, it's not true at all. It's an excuse for not using types. The same
> amount of work happens in both cases. If you're doing a good job, you're
> going to do just the same amount of work if you do it in Ruby or Python or in
> OCaml or Haskell. The difference is in the distribution of that work.

> In Ruby/Python/whatever the work is at the end when you start running in
> production and it falls over all the place because you forgot that the type
> you expected is not the type that actually existed or you made a change
> somewhere and forgot to make it somewhere else. You have to work through all
> that at the end, but in the beginning it feels like you're programming a lot
> faster. Whereas languages with a type-inferred static type system, that work
> would be distributed throughout the time in which you're doing the
> programming. So it can feel like you're going slower because you're doing
> more work up front, but you're essentially going at the same speed.

> What does happen is that a lot of times in dynamic languages you won't catch
> all the edge cases. It means you won't have to do that work, but it's also a
> bomb in your code that's waiting to blow up. Static types force you to
> address all of these problems, before you can compile the code.
