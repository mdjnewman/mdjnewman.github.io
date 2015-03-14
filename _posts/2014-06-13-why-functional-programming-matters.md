---
title: Why Functional Programming Matters
author: mdjnewman
layout: post
categories:
  - Functional programming
---
The following is the conclusion from a paper entitled ‘Why Functional Programming Matters':

> In this paper, we’ve argued that modularity is the key to successful programming. Languages that aim to improve productivity must support modular programming well. But new scope rules and mechanisms for separate compilation are not enough — modularity means more than modules. Our ability to decompose a problem into parts depends directly on our ability to glue solutions together. To support modular programming, a language must provide good glue. Functional programming languages provide two new kinds of glue — higher-order functions and lazy evaluation. Using these glues one can modularize programs in new and useful ways, and we’ve shown several examples of this. Smaller and more general modules can be reused more widely, easing subsequent programming. This explains why functional programs are so much smaller and easier to write than conventional ones. It also provides a target for functional programmers to aim at. If any part of a program is messy or complicated, the programmer should attempt to modularize it and to generalize the parts. He or she should expect to use higher-order functions and lazy evaluation as the tools for doing this.
> 
> Of course, we are not the first to point out the power and elegance of higher-order functions and lazy evaluation. For example, Turner shows how both can be used to great advantage in a program for generating chemical structures. Abelson and Sussman stress that streams (lazy lists) are a powerful tool for structuring programs. Henderson has used streams to structure functional operating systems. But perhaps we place more stress on functional programs’ modularity than previous authors.
> 
> This paper is also relevant to the present controversy over lazy evaluation. Some believe that functional languages should be lazy; others believe they should not. Some compromise and provide only lazy lists, with a special syntax for constructing them (as, for example, in Scheme). This paper provides further evidence that lazy evaluation is too important to be relegated to second-class citizenship. It is perhaps the most powerful glue functional programmers possess. One should not obstruct access to such a vital tool.

[J. Hughes, “Why Functional Programming Matters,” Comput. J., vol. 32, pp. 98–107, 1989.][1]

This paper was written twenty years ago – the more things change, the more they stay the same. I’d urge any programmer (whether currently interested in FP or otherwise) to read this paper if you haven’t already.

 [1]: http://comjnl.oxfordjournals.org/content/32/2/98.short "Why Functional Programming Matters"