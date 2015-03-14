---
title: All posts
permalink: /all-posts/
layout: page
---

<ul>
  {% for post in site.posts %}
  <li>
    <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
  </li>
  {% endfor %}
</ul>
