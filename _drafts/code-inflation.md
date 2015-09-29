---
title: 'Code inflation and the three laws'
layout: post
---

A while ago I read [Code Inflation](http://www.computer.org/cms/Computer.org/ComputingNow/issues/2015/04/mso2015020010.pdf) written by Gerard J. Holzmann for IEEE Software Magazine.

There have been a lot of advances in software development tools and hardware in
the last 50 years, but a lot of these benefits aren't easy to see because
software that is written now is nothing like software that was written 60 years
ago. According to Holzmann, there are three laws that are influencing things
here.

## The First Law - Software tends to grow over time, whether or not a rational need for it exists

> So, why does software grow? The answer seems to
> be: because it can. When memory was measured in Kbytes, it simply wasn't
> possible to write a program that consumed more than a fraction of that amount.
> With memory sizes now reaching Gbytes, we seem to have no incentive to pay
> attention to a program's size, so we don't.

The `true` command (which just returns a `0` exit code and does nothing else) on
Linux based systems started out as an empty file. `true` always returned `0` to
the calling shell by virtue of not executing any commands. A script that does
nothing will always exit successfully.

I checked the size of `true` on my laptop:

```bash
$ which true
/usr/bin/true
$ ls -lh /usr/bin/true
-rwxr-xr-x  1 root  wheel    13K 10 Sep  2014 /usr/bin/true
```

So here is a program that essentially does the same thing as a 0 byte shell
script, but it now uses 13,728 bytes. If you know why a program whose sole job
is to exit with a successful status code is so huge, please let me know.

You may be thinking none of this matters, but the second law suggests otherwise.

## The Second Law - All nontrivial code has defects

> The more code you use to solve a problem, the harder it gets for someone else
> to understand what you did and to maintain your code when you have moved on to
> write still larger programs.

## The Third Law - The probability of nontrivial defects increases with code size
