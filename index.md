---
layout: title
title: Home
---

The OHBA Software Library (OSL) is created by the OHBA Analysis Group, OHBA, Oxford, UK.

OSL is a set of Matlab tools and scripts for running M/EEG analysis on CTF and Elekta Neuromag data, and is written mainly by members of the OHBA Analysis Group. It uses a combination of FSL, SPM and Fieldtrip.

### Get OSL

OSL is distributed as an archive: [download a copy of OSL here](http://users.fmrib.ox.ac.uk/~romesh/osl/osl.tar.gz)

Note that you will need to have FSL installed in order to use OSL - you can obtain FSL [here](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation).

The download archive file contains the contents of our GitHub repositories, as well as a number of supporting directories. For installation instructions, see the readme file contained in the archive. 

Issues? Contact us at [analysis@ohba.ox.ac.uk](mailto:analysis@ohba.ox.ac.uk). Please note that we only have limited capacity to provide technical assistance at this stage, so OSL is publicly distributed as-is and we provide support on a best-effort basis. 

### Tutorial examples

OSL comes with several tutorials to illustrate usage. The pages below document these, but you can run them yourself using the example files included with OSL. 

[Download tutorial data](http://users.fmrib.ox.ac.uk/~romesh/osl/example_data.tar.gz)

Note that we cannot publicly distribute data for all of the examples due to confidentiality restrictions, so currently it is not possible to run all of the tutorials using the public OSL release. 

<ul>
  {% assign sorted_pages =  site.pages | sort:"title" %}
  {% for page in sorted_pages %}
    {% if page.resource == true %}
      {% for pc in page.categories %}
        {% if pc == "examples" %}
          <li><a href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}   <!-- cat-match-p -->
      {% endfor %}  <!-- page-category -->
    {% endif %}   <!-- resource-p -->
  {% endfor %}  <!-- page -->
</ul>

### Extra content 

OSL is a set of Matlab tools and scripts for running M/EEG analysis on CTF and Elekta Neuromag data, and is written mainly by members of the OHBA Analysis Group. It uses a combination of FSL, SPM and Fieldtrip. FSL needs to be installed before OSL can be used. SPM and Fieldtrip come included.

OSL includes OAT (OSL’s easy Analysis Tool), which can be used to analyse a multi-subject MEG study in source or sensor space.

Overview of Tools

Preprocessing
using Maxfilter
oslview
AFRICA (ICA denoising)
Co-registration and forward modelling
OAT (multi-subject analysis of task M/EEG data)
OIL (multi-subject analysis of task/resting M/EEG data using ICA)

Download OSL

Getting started

Support
OSL workshops
Source code on Github