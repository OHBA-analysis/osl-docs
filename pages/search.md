---
layout: default
title: Search
tipue_search_active: true
exclude_from_search: true
---

<form action="{{ page.url | relative_url }}">
  <div class="tipue_search_left"><img src="{{ "/assets/tipuesearch/search.png" | relative_url }}" class="tipue_search_icon"></div>
  <div class="tipue_search_right"><input type="text" name="q" id="tipue_search_input" pattern=".{3,}" title="At least 3 characters" required></div>
  <div style="clear: both;"></div>
</form>

<div id="tipue_search_content"></div>

<script>
$(document).ready(function() {
  $('#tipue_search_input').tipuesearch({'show':100});
});
</script>
<!-- 
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
{% endfor %} -->