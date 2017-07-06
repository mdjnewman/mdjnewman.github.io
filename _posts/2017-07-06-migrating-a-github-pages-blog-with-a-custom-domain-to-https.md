---
title: Migrating a GitHub Pages blog with a custom domain to HTTPS
layout: post
---

At the time of writing, this blog is hosted on [GitHub Pages](https://pages.github.com/),
which has been working well since I set it up a [few years back](https://github.com/mdjnewman/mdjnewman.github.io/commit/9e1e0836999aec7393d0314f9066040b94ef8c43).

The only thing that has bugged me for a while now is that the whole site was
served over HTTP, rather than HTTPS.

I wanted to move to move this blog to HTTPS, but with some constraints:

* Continue using GitHub pages (it's free and easy, I don't want to manage a
  server)
* No certificate renewal (smart me plans for stupid me, who would surely forget
  to renew a cert)
* Continue using my domain (mdjnewman.me)
* No cost

GitHub pages doesn't support HTTPS for custom domain names, as it uses a
certificate with a wildcard SAN of `*.github.io`.

[CloudFlare](https://www.cloudflare.com/) offers HTTPS on a free plan, which
Troy Hunt has [written
about](https://www.troyhunt.com/how-to-get-your-ssl-for-free-on-shared/)
before.

It looks like this will meet my constraints above - I get to keep using GitHub
Pages, I don't have to manage a cert (CloudFlare takes care of this), and I can
keep using my custom domain.

The steps I followed to do this were relatively simple:

1. Exported a zone file from current nameservers
1. Completed the CloudFlare onboarding, during which I imported the above zone file
1. Updated the authoritative DNS servers for my domain to the
   `*.ns.cloudflare.com` name servers:
    ![Update name servers](/public/images/2017/07/migrating-to-https-nameservers.png)
1. Tested the site out,
   [fixed](https://github.com/mdjnewman/mdjnewman.github.io/commit/4b2a2237e1c00d9e280566f6d288f5870e250927)
   a CSS link that was loaded over HTTP
1. Forced HTTPS in CloudFlare:
    ![Enforcing HTTPS with CloudFlare](/public/images/2017/07/migrating-to-https-enforce-https.png)

... and that was it. I finished this in part of an afternoon.

Shortcomings
------------

There is one major shortcoming with this setup: **there is no certificate
validation between CloudFlare and GitHub** (CloudFlare supports fetching from
an origin without validating certificates, which is the option I've chosen -
'strict' HTTPS can be enabled for most use cases).

As we mentioned before, the GitHub cert is valid for `*.github.io`, and we're
using my custom domain, which is `mdjnewman.me`.

If we switched off the custom domain on GitHub, and did some smarts in
CloudFront to rewrite requests so that the request to GitHub was using
`mdjnewman.github.io`, then we'd get HTTPS all the way to GitHub servers.

CloudFlare does support
[rewriting HTTP Host headers](https://support.cloudflare.com/hc/en-us/articles/206652947-Using-Page-Rules-to-Re-Write-Host-Headers)
, but it's an enterprise feature.

I could switch to using [CloudFront](https://aws.amazon.com/cloudfront/) with
an [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/) cert,
which would meet all the above constraints except for 'no cost' (admittedly, my tiny
blog doesn't get much traffic, so the cost would be minimal).

Given that most of the shenanigans with injecting content into web sites
happens at the last leg of a connection (I'm looking at you, dodgy internet
cafe), I'm happy that the new setup for this blog mitigates that problem and am
willing to accept the cost/security trade-off. It's possible for someone to
perform a man in the middle attack impersonate GitHub, but given my site has no
sensitive information I'm not too worried about this threat model (Troy Hunt
also [wrote
about](https://www.troyhunt.com/cloudflare-ssl-and-unhealthy-security-absolutism/)
this trade-off).