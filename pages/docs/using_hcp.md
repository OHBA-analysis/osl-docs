---
layout: default
title: Using the HCP dataset
resource: true
categories: documentation
---

_Moved from Google Sites wiki_

The HCP dataset may be freely downloaded from the [HCP database](https://db.humanconnectome.org/app/template/Login.vm) (after registering). As of November 2014 there are 67 subjects with resting state and task MEG. Documentation on the MEG2 release may be found [here](http://www.humanconnectome.org/study/hcp-young-adult/document/500-subjects-data-release/).

The processing scripts provided as part of the HCP are written in Fieldtrip and are not readily compatible for use with OSL at this point (primarily due to the sMRI files being masked for anonymity purposes). However, full coregistration information is provided and this may be used at a later stage to further integrate the dataset with OSL pipelines. At this stage, custom beamforming scripts have been written by the Analysis group to use the (preprocessed) HCP data. These may be found in OSL2 in the HCP subdirectory.

There are a number of points of note regarding these scripts:

- The preprocessed data has been used - for the resting state data certain epochs have been discarded, which are then concatenated.
- The grid spacing used is in MNI space, but is offset from the standard templates used in OSL/FSL. Separate MNI templates and masks are provided for this grid.