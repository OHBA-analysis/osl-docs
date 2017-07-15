---
layout: default
title: Site map
---

{% assign sorted_pages =  site.pages | sort:"title" %}

<p>Uncategorised</p>
<ul>
{% for page in sorted_pages %}
  {% unless page.categories %}
    {% if page.title %}
    <li><a href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a></li>
    {% endif %} 
  {% endunless %} 
{% endfor %}
</ul>

{% for cat in site.category-list %}
<p>{{cat | capitalize}}</p>
<ul>
  {% for page in sorted_pages %}
      {% for pc in page.categories %}
        {% if pc == cat %}
          <li><a href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a></li>
        {% endif %} 
      {% endfor %}
  {% endfor %}
</ul>
{% endfor %}