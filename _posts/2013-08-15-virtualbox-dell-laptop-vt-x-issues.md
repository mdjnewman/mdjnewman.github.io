---
title: VirtualBox + Dell laptop VT-x issues
author: mdjnewman
layout: post
permalink: /2013/08/virtualbox-dell-laptop-vt-x-issues/
categories:
  - Uncategorized
tags:
  - how-to
---
I recently had to use a VM for a uni project, and needed to have access on my laptop & desktop. I haven’t used a VM on my laptop in a
while, but didn’t expect to see the following error message from VirtualBox (4.2.16):

> VT-x features locked or unavailable in MSR.

I’ve used x64 hosts before with no problems, but I guess my BIOS settings were reverted for some reason (using a Dell laptop
with Intel PM45 chipset).

So thinking to myself that this should be an easy fix, I rebooted, enabled VT-x and restarted, but I received the same error
message. No amount of changing BIOS/VirtualBox settings, rebooting or otherwise reconfiguring would make this message go away.

I eventually read that it’s sometimes **necessary to power down and physically disconnect the machine from power to properly
enable VT-x**. This solved my problem – I decided to make a note of it here to hopefully help someone else in the same situation.
