---
title: 'Ubuntu 12.10 – Transmission fails to connect to HTTPS trackers'
author: mdjnewman
layout: post
permalink: /2013/01/ubuntu-12-10-transmission-fails-to-connect-to-https-trackers/
categories:
  - Uncategorized
tags:
  - how-to
  - ubuntu
---
[Transmission][1], the BitTorrent client installed by default in Ubuntu seems to have an issue with connecting to trackers using HTTPS at the moment.

After Transmission failed to connect to a tracker using HTTPS, I went searching and found this [bug report][2].

The steps there are pretty simple and worked well for me:

1. Close Transmission
2. Download the .deb for updated libgnutls26 from [here][3] (bottom of page – choose your architecture then mirror)
3. Install using

        dpkg -i (package name).deb

4. Restart Transmission

* * *

UPDATE: It looks like this is now fixed, so running

```
sudo apt-get update
sudo apt-get upgrade
```

should get it working again for you.

[1]: http://www.transmissionbt.com/ "Transmission"
[2]: https://bugs.launchpad.net/ubuntu/+source/gnutls26/+bug/937537 "libgnutls26 2.12.14 breaks SSL tracker support in Transmission"
[3]: http://packages.debian.org/wheezy/libgnutls26