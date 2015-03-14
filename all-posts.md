---
title: All posts
author: mdjnewman
permalink: /all-posts/
layout: page
---

<ul>
  {% for post in site.posts %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
  </li>
  {% endfor %}
</ul>
