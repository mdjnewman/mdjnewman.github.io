---
title: When should I force push after rebasing?
layout: post
---

tl;dr: assuming it's your own branch, **immediately**.

---

On the last few projects I have been a part of, I have been the defacto Git
problem solver.

{% include figure.html src="https://imgs.xkcd.com/comics/git.png" alt="XKCD Git Comic" caption='(obligatory <a href="https://xkcd.com/1597/">xkcd</a>)' %}

On more than one occasion, I was presented with something like the following:

```
$ git l master
* 232e985 (origin/master, origin/HEAD, master) Feature 4
* 94989d0 Feature 3
* 296d0b3 Feature 2
* 4b856cd Feature 1

$ git l feature-5
* 5c31f6d (HEAD -> feature-5) Feature 4
* 420f83b Feature 3
* 724236a (origin/feature-5) Feature 5
* 296d0b3 Feature 2
* 4b856cd Feature 1
```

In the above, the commits adding features 3 and 4 on each branch are logically
the same, but on the `feature-5` branch they've somehow ended up after the
commit adding feature 5.

The team was using feature branches, and the author of feature 5 above was
trying to rebase their changes onto master, but somehow ended up inserting
their commit between commits on master. At this stage, you're in a pretty bad
place, as you've diverged from master.

How did this happen? I'm guessing it was the following series of events:

* Developer branches from master to create feature-5
* Features 3 & 4 are pushed to master
* Feature 5 is committed to the feature-5 branch
* Developer runs `git pull --rebase origin master` or similar
* ... some time passes ...
* Developer runs `git pull --rebase` without really thinking about it

<!--
<script src="https://cdnjs.cloudflare.com/ajax/libs/gitgraph.js/1.11.3/gitgraph.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/gitgraph.js/1.11.3/gitgraph.css" />

<script>
var gitGraphTemplateConfig = {
          colors: ["#979797", "#008fb5", "#f1c109"],
          branch: {
            lineWidth: 10,
            spacingX: 50,
            labelRotation: 0
          },
          commit: {
            spacingY: -80,
            dot: {
              size: 14
            },
            message: {
              displayAuthor: false,
              displayBranch: false,
              font: "normal 14pt Arial"
            }
          }
        };

var gitGraphTemplate = new GitGraph.Template( gitGraphTemplateConfig );
</script>
-->
After the first few steps above, we have something like the following:

<!--
<div style="overflow-x: scroll">
<canvas id="gitgraph-1" height="800"></canvas>
</div>
<script>
var gitgraph = new GitGraph( { template: gitGraphTemplate, elementId: "gitgraph-1" })
var master = gitgraph.branch("master")
gitgraph.commit( { message: "Feature 1", sha1: "4b856cd" })
gitgraph.commit( { message: "Feature 2", sha1: "296d0b3" })
gitgraph.branch("feature-5" )
gitgraph.commit( { message: "Feature 5 (feature-5, origin/feature-5)", sha1: "724236a" })
master.checkout()
gitgraph.commit( { message: "Feature 3", sha1: "94989d0" })
gitgraph.commit( { message: "Feature 4 (master, origin/master)", sha1: "232e985" })
</script>
-->

{% include figure.html src="/public/images/2017/07/git-1.png" alt="Commits after creating feature branch" %}

So far, so good. We want to rebase our changes onto master, so that we can test
and push our code. After `git pull --rebase origin master`:

<!--
<div style="overflow-x: scroll">
<canvas id="gitgraph-2"></canvas>
</div>
<script>
var gitgraph = new GitGraph( { template: gitGraphTemplate, elementId: "gitgraph-2" })
var master = gitgraph.branch("master")
gitgraph.commit( { message: "Feature 1", sha1: "4b856cd" })
gitgraph.commit( { message: "Feature 2", sha1: "296d0b3" })
gitgraph.branch("origin/feature-5" )
gitgraph.commit( { message: "Feature 5 (origin/feature-5)", sha1: "724236a" })
master.checkout()
gitgraph.commit( { message: "Feature 3", sha1: "94989d0" })
gitgraph.commit( { message: "Feature 4 (master, origin/master)", sha1: "232e985" })
gitgraph.commit( { message: "Feature 5 (feature-5)", sha1: "44e1c44" })
</script>
-->

{% include figure.html src="/public/images/2017/07/git-3.png" alt="Commits after rebasing onto master" %}

Still looking good. At this stage, we could `git push --force origin feature-5`
and all would be well in the world.

But what happens if we go for a tea and forget what we were doing (or we use an
overzealous git GUI tool), and we try to rebase onto `origin/feature-5`?

<!--
<div style="overflow-x: scroll">
<canvas id="gitgraph-3"></canvas>
</div>
<script>
var gitgraph = new GitGraph( { template: gitGraphTemplate, elementId: "gitgraph-3" })
var master = gitgraph.branch("master")
gitgraph.commit( { message: "Feature 1", sha1: "4b856cd" })
gitgraph.commit( { message: "Feature 2", sha1: "296d0b3" })
gitgraph.branch("feature-5" )
gitgraph.commit( { message: "Feature 5 (origin/feature-5)", sha1: "724236a" })
gitgraph.commit( { message: "Feature 3", sha1: "420f83b" })
gitgraph.commit( { message: "Feature 4 (feature-5)", sha1: "5c31f6d" })
master.checkout()
gitgraph.commit( { message: "Feature 3", sha1: "94989d0" })
gitgraph.commit( { message: "Feature 4 (master, origin/master)", sha1: "232e985" })
</script>
-->

{% include figure.html src="/public/images/2017/07/git-2.png" alt="Commits after rebasing from our remote branch - shows duplicate commits" %}

What we see above is the result of Git rebasing commits `94989d0`, `232e985`
and `44e1c44` on top of `origin/feature-5`. As the commit ID is computed by
hashing of the contents of a commit and its parent, the same logical commits
from master now exist on our branch with different IDs.

This could have been avoided if we followed this rule of thumb:

> **If you're working on your own branch, always push immediately after rebasing.**

Some people on the team were seeing a message like the following:

```
Your branch and 'origin/feature-5' have diverged,
and have 3 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
```

and assuming that they should `git pull --rebase`, which in this case is exactly what you *don't* want.

If you're looking for further reading [Getting Started - Git Basics](https://git-scm.com/book/en/v1/Getting-Started-Git-Basics) covers the fundamentals and [LearnGitBranching](http://learngitbranching.js.org/) is a great interactive tool.

Diagrams were created using [Gitgraph.js](http://gitgraphjs.com/), and [this script](/public/2017-07-05-when-should-i-force-push-after-rebasing-script.sh) creates an example repository.
