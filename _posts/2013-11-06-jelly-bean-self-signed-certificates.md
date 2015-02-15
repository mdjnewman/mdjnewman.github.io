---
title: Installing self signed certificates on Android (Jelly Bean)
author: mdjnewman
layout: post
permalink: /2013/11/jelly-bean-self-signed-certificates/
categories:
  - Uncategorized
tags:
  - how-to
---
I was pretty happy when I found out Android now supports installing self signed certificates, but had some trouble getting the certificate I use for administering this blog installed.

So, a quick note for anyone who is attempting to install a self signed SSL certificate on Jelly Bean Android devices: **you can only install a root CA certificate** (i.e. a certificate with &#8220;Subject Type=CA&#8221;).

Trying to install a certificate for a single site (i.e. a certificate with &#8220;Subject Type=End Entity&#8221;) isn&#8217;t possible as far as I can tell. I don&#8217;t have any references for this, it&#8217;s just based from my experience, so let me know if you&#8217;ve experienced otherwise.