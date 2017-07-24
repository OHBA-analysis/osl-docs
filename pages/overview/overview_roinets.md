---
layout: default
title: MEG-ROI-nets
resource: true
categories: overview
---

Resting-state network analyses can be performed with the ROInets package in OSL. 

See also:
[MEG-ROI-nets on Github](https://github.com/OHBA-analysis/MEG-ROI-nets)

Starting with source-reconstructed data and a parcellation defining several regions of interest (ROIs), group level network matrices can be produced from the resting-state data. Multivariate corrections for spatial source leakage are performed as standard. 


To begin, type 

	help osl_network_analysis

There is also a template file

	edit ROInets.example
	edit ROInets.example_multiSubj


The code package also includes several functions for:
- conversion from correlations to z-stats
- conversion between probabilities and z-stats
- performing multiple comparison corrections using the false discovery rate
- constructing single time-courses to represent entire regions of interest
- various methods of orthogonalising vectors, e.g. to remove the zero-lag correlations introduced by source reconstruction methods

To start exploring, type 

	help ROInets.Contents

To see a full description of the method, see "Colclough, G. L. et al. _A symmetric, multivariate leakage for MEG connectomes_ NeuroImage (2015)".