---
title: 'Maybe Haskell &#8230;'
author: mdjnewman
layout: post
permalink: /2013/09/maybe-haskell/
categories:
  - Functional programming
---
After reading [Learn You a Haskell][1] on and off over the past fortnight and watching a couple of Erik Meijer&#8217;s [Functional Programming Fundamentals][2], I finally got around to installing the Haskell platform and firing up GHCi.

After a couple of hours of implementing the simple functions scattered throughout LYAH, I was up to [implementing quick sort][3]. Given the number of times I&#8217;ve seen this example, I&#8217;m not going to reproduce it here, but it&#8217;s pretty amazing[ [1]][4].

One of the main things I noticed was that after two hours of writing code in a language I&#8217;d never used, I&#8217;d produced **zero run time errors**. There were plenty of compile errors, but that&#8217;s to be expected &#8211; especially given I was using an editor that was inserting tabs in a language with significant white space (which, by the way, makes for fun times when unfamiliar with Haskell compiler errors). I know what kind of error I would prefer to deal with.

So far I&#8217;m liking Haskell, and I think it&#8217;s a huge shame that there is only one functional programming course at my university ([COMP1024][5]), which isn&#8217;t available to most dual degree students.

* * *

<a name="f1"></a>1. I know this isn&#8217;t &#8216;true&#8217;, in-place, high performance quick sort, but in how many other languages can you write a readable, generic sorting algorithm in 6 lines of code?

 [1]: http://learnyouahaskell.com/ "Learn You a Haskell"
 [2]: http://channel9.msdn.com/Series/C9-Lectures-Erik-Meijer-Functional-Programming-Fundamentals "Erik Meijer - Functional Programming Fundamentals"
 [3]: http://learnyouahaskell.com/recursion#quick-sort "Learn You a Haskell - Recursion"
 [4]: #f1
 [5]: http://www.uq.edu.au/study/course.html?course_code=COMP1024 "Conceptual Foundations of Computer Programming (COMP1024)"