---
title: Travel posts
layout: post
category: Software/Tech
---

Sometime in the next couple of days I'm going to publish a bunch of back dated
posts about travel I've done recently (or in some cases not so recently).

This is a bit of a departure from what has been the norm on this blog so far,
and for those following via RSS I've introduced categories and separate feeds
for the [Software/Tech]({{ site.baseurl }}/feed/category/software-tech/)
category and the [Travel]({{site.baseurl }}/feed/category/travel/) category in
addition to the [existing feed containing all posts]({{ site.baseurl }}/feed/).
If you'd rather not hear about travel posts, please update your subscription :)

A lot of these posts are taken straight from emails I sent to family and
friends at the time I did the actual travel.

Technically, the only interesting part of this is handling the images I wanted
to include in the posts. I've included a few images in the past, but never in a
large quantity.

I use Google Photos/Drive for all my photos, and originally tried
hotlinking the photos from there. If this was supported it would have been the
best solution, as I wouldn't have to duplicate the photos and it would be easy
to include them (though some of them are quite large). Unfortunately (though
unsurprisingly) Google Photos/Drive doesn't support hotlinking, and any direct
links to images expire after a while.

The next option was using the Google Drive 'embed' functionality, which
involves inserting some HTML into the post which will load an IFrame. This
worked, but:

* it looked a little clunky on desktop and didn't scale well on mobile
* a Google IFrame means Google tracking cookies
* performance was poor - loading all the images on one of the travel posts
  using this method resulted in a whole load of extra requests:

{% include figure.html src="/public/images/2018/06/google-drive-iframe-performance.png" %}

I ended up committing them into the Git repository that backs this static site,
but that does mean the repo size is going to grow a lot more than it should. As
it's just me working on this repo though, I can always use [`git
filter-branch`](https://git-scm.com/docs/git-filter-branch) as a last resort if
I do want to move the images elsewhere.

I did fairly aggressively reduce the file size with ImageMagick:

```
mogrify -sampling-factor 4:2:0 \
  -strip \
  -quality 85 \
  -interlace JPEG \
  -colorspace sRGB \
  -resize 50% \
  -auto-orient
  *
```

The final change was adding lazy loading using [Lozad.js][lozad]. Thankfully I
include almost all the images on my site using a [custom Jekyll
include][figure-include] so I just had to include the library and change one
file to get lazy loading across the board.


[lozad]: https://github.com/ApoorvSaxena/lozad.js
[figure-include]: https://github.com/mdjnewman/mdjnewman.github.io/blob/master/_includes/figure.html
