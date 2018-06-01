---
title: 'Maybe Haskell …'
layout: post
category: Software/Tech
---

After reading [Learn You a Haskell][1] on and off over the past fortnight and watching a couple of Erik Meijer’s [Functional Programming Fundamentals][2],
I finally got around to installing the Haskell platform and firing up GHCi.

After a couple of hours of implementing the simple functions scattered throughout LYAH, I was up to [implementing quick sort][3].
Given the number of times I’ve seen this example, I’m not going to reproduce it here, but it’s pretty amazing <sup>[1](#f1)</sup>.

One of the main things I noticed was that after two hours of writing code in a language I’d never used, I’d produced
**zero run time errors**. There were plenty of compile errors, but that’s to be expected – especially given I was
using an editor that was inserting tabs in a language with significant white space (which, by the way, makes for fun
times when unfamiliar with Haskell compiler errors). I know what kind of error I would prefer to deal with.

So far I’m liking Haskell, and I think it’s a huge shame that there is only one functional programming course at
my university ([COMP1024][4]), which isn’t available to most dual degree students.

**Edit**: COMP1024 hasn't been offered since 2010.

* * *

<a name="f1"></a>1. I know this isn’t ‘true’, in-place, high performance quick sort, but in how many other languages can you write a readable, generic sorting algorithm in 6 lines of code?

 [1]: http://learnyouahaskell.com/ "Learn You a Haskell"
 [2]: http://channel9.msdn.com/Series/C9-Lectures-Erik-Meijer-Functional-Programming-Fundamentals "Erik Meijer - Functional Programming Fundamentals"
 [3]: http://learnyouahaskell.com/recursion#quick-sort "Learn You a Haskell - Recursion"
 [4]: http://www.uq.edu.au/study/course.html?course_code=COMP1024 "Conceptual Foundations of Computer Programming (COMP1024)"
