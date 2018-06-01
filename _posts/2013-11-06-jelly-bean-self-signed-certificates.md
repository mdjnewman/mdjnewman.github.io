---
title: Installing self signed certificates on Android (Jelly Bean)
layout: post
category: Software/Tech
---

I was pretty happy when I found out Android now supports installing self signed certificates, but had some trouble getting the certificate I use for administering this blog installed.

So, a quick note for anyone who is attempting to install a self signed SSL certificate on Jelly Bean Android devices: **you can only install a root CA certificate** (i.e. a certificate with “Subject Type=CA”).

Trying to install a certificate for a single site (i.e. a certificate with “Subject Type=End Entity”) isn’t possible as far as I can tell. I don’t have any references for this, it’s just based from my experience, so let me know if you’ve experienced otherwise.
