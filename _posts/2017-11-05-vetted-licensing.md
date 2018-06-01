---
title: Vetted - choosing an appropriate license
layout: post
category: Software/Tech
---

*See [Vetted - a new project][vetted-a-new-hope] for some background.*

I'm hoping to start pushing some code soon. Before I do, it's a good
opportunity to do some reading into a topic that I am more ignorant of than I
should be: software licensing. The following is what I've learnt so far.

Disclaimer: I am not a lawyer and this may be totally incorrect, and as such
should not be used as the basis for any decision ever.

Once code is released as open source software, most common
OSS licenses (GPL, BSD, MIT, Apache etc) do not allow for the revocation of
rights granted under the license. This is a good thing. Imagine having to be
prepared for any open source library/framework you're currently using become
proprietary software with no warning. Such uncertainty would severely limit the
utility of open source software.

It *is* possible for the current copyright owners to relicense their creations.
So, theoretically, any OSS software can be relicensed if all copyright owners
agree. The important part is that this relicensing does not revoke the rights
assigned under the previous license. So if I've released some software as open
source software, I can decide a year later to relicense it and create a
commercial version, with the following caveats:

* I still own the copyright for the entire project
    * I need to have been the sole contributor to the project, or to have
      ensured that contributors have assigned copyright to me for their work
* The existing rights assigned under the OSS license remain in place
    * If the license permits, anyone can fork the project at this point
      and develop/use their own version

Given what I've learned above, I'm planning to license the project under an OSS
license, but I won't accept any contributions until I've got some kind of
Contributor License Agreement (CLA) in place. This is a common approach, take a
look at the [GitHub CLA][gh-cla].

This is likely the first of many posts where it might seem I'm researching a
topic and deliberating a little excessively, given I have no working software
or even a particularly interesting idea. It's fairly premature to assume that
there are going to be any contributors to this project other than myself. I
don't believe veterinary practice management software is so exciting that I am
going to be swamped with contributions. However, as I [mentioned
earlier][vetted-a-new-hope], this whole project is mainly a learning
opportunity for me.

---

Further resources:

* [choosealicense.com](https://choosealicense.com)
* [GitHub CLA][gh-cla]
* [Phil Haack's excellent three part series][haacked-part-1]
* [Open source licensing: What every technologist should know][what-every-techy-should-know]
* [Developer Supply Chain Management][developer-scm]


[vetted-a-new-hope]: /2017/11/vetted-a-new-hope/
[gh-cla]: https://cla.github.com/
[what-every-techy-should-know]: https://opensource.com/article/17/9/open-source-licensing
[haacked-part-1]: https://haacked.com/archive/2006/01/24/TheDevelopersGuideToCopyrightLaw-Part1.aspx
[developer-scm]: http://blogs.tedneward.com/post/developer-scm/
