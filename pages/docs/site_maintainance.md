---
layout: default
title: Site maintainance
resource: true
categories: documentation
---

This site is a fairly standard GitHub Pages setup using Jekyll. Documents are served from the osl-docs repository. Most of the extras like page lists and navigation sections are handled automatically. Here are some of the common tasks

* TOC
{:toc}

## Writing pages

### Making a new page

Make a new file anywhere - but best to put it in the `docs` folder. Start the file with

	---
	layout: default
	title: MyTitle
	resource: true
	categories: documentation
	---

The document will automatically be added to the navbar section corresponding to its category, and the title will also be placed at the top of the page content. After this header, write content in Markdown (the same as on GitHub wiki pages). 

### Adding a table of contents

Put

	* TOC
	{:toc}

at the top of the page

### Adding an image

	![resting_state](preprocessing_pipeline.jpg){:style="max-height: 400px;"}

### Linking to a file

	[session3_ohba_workshop_osl_source_recon_2017.pdf]({{ site.baseurl }}/downloads/- session3_ohba_workshop_osl_source_recon_2017.pdf)

### Linking to another wiki page

	[Link]({{ site.baseurl }}/Home)
	[a relative link](another-page.md)

### Linking to a section within the wiki

If the section has a title (e.g. with a series of hashes) then you can refer to it as

	### My Section
	See [here](#another-section)

	### Another section

where spaces are swapped for hyphens and everything is lowercase. 

### Linking to a Matlab tutorial

	[link]({{ site.baseurl }}/matlab/osl_example_oslview.html)

## Writing tutorials

### Making a new tutorial

1. Write the content in Matlab
2. Run `osl_publish` on your Matlab file
3. Add and commit the files in the `osl-docs` repository (NOT `osl-core`)

### Renaming a tutorial

One thing that `osl_publish` does instead of just `publish` is that automatically adds the requisite YAML header to the resulting HTML file so that it is included when the site is built by Jekyll. All of the published tutorials start with something like

	---
	layout: matlab_wrapper
	title: OAT 3 - Sourcespace Analysis
	resource: true
	categories: examples
	---

The title or category could be manually changed, if designed. However, so that the tutorials can be rebuilt when required, is is highly advised to edit the tutorial script and to re-publish it, rather than making manual changes to the pages. 

## Managing the site

### Making a new nav section

Open `_config.yml`. There is a list of categories e.g.

	category-list: [overview,examples,documentation,archive]

Add your category to the list. It will appear in the navbar and any pages given that category will automatically be added to it

### Making a link to a page in the navbar

If you just want to link to a page in the navbar, edit `_includes/navigation.html`. There is a list that corresponds to the content of the navbar. Currently, the first item in the list is a link to the home page e.g.

	<li><a href="{{ site.baseurl }}/"">Home</a></li>

Add other links in the same way. Put them before or after the automatically generated set of dropdowns.
