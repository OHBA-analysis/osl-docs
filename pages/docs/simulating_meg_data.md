---
layout: default
title: Simulating MEG data
resource: true
categories: documentation
---

OSL includes software for simulating MEG sensor data.

By specifying the location and activity of any number of dipoles, the corresponding signals in the MEG sensor array can be simulated. White noise with a covariance structure drawn from empty room measurements can be added. 

The user must provide a template SPM file, which contains information about the scanner and sensors for which data are being simulated. You can use an SPM object from any previous recording. 

To get started, type:

	help osl_simulate_MEG_data

There is also a template file:

	edit osl_example_simulate_MEG_data

The simulation package includes some functionality for transforming dipoles and meshes. For more info, type:

	help MEGsim.Contents
