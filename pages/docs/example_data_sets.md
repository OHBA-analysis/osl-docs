---
layout: default
title: Example data sets
resource: true
categories: documentation
---

* TOC
{:toc}

_Moved from Google Sites wiki_

## Eyes-Closed/Eyes-Open/Movie data

Ten healthy volunteers (7 males and 3 females, aged 27 years old on average) underwent a 10 minute block scan where the participant was scanned awaken at rest with their eyes closed and 10 minute block where the participant watched a movie. MEG. Data were acquired using a CTF 275 channel whole-head system. The data were sampled at a frequency of 600Hz and synthetic third order gradiometer correction was applied to reduce external interference. Head localisation within the MEG helmet was achieved using three electromagnetic head position indicator (HPI) coils placed at three fiducial points. By periodically energising these coils the head position within the MEG sensor array was identified. Structural MR images for each subject were acquired using a Philips Achieva 3T MRI system. 

The data set is presented in 

- SPM8 format and can be found in `hbaws11.ohba.ox.ac.uk@/home/disk3/hluckhoo/data/spm_files/3-state`
- in FIF format in `hbaws11.ohba.ox.ac.uk@/home/disk3/hluckhoo/data/fif_files/3-state`

## APOE data

This data set was used to investigate electrophysiological differences in the resting-state brain function according to the APOE-ε4 allele compared with APOE-ε3 homozygotes. 

46 healthy volunteers (25 males and 21 females, aged 47 on average) were recruited. The cohort comprised three sub- groups, based on APOE genotype: ε2-ε3 heterozygotes (12 subjects, 5 males), ε3 homozygotes (16 subjects, 9 males), and ε4 carriers (18 subjects, 11 males). Each participant was scanned for two 6 minutes sessions of eyes-open resting-state with a fixation cross. The data were acquired using an Elekta Neuromag 306 channel system at a sampling rate of 1kHz. Structural MR images for each subject were acquired at the University of Oxford Centre for Clinical Magnetic Resonance Research (OCMR) using a 3-T Siemens Trio scanner with a 12-channel head coil. The neuroimaging protocol included a 3D T1-weighted structural scan (MPRAGE, repetition time (TR) = 2040 ms, echo time (TE) = 4.7 ms, inversion time (TI) = 900ms, flip angle = 8 degrees, field of view = 192 mm, voxel dimension = 1 mm isotropic, scan time = 12 min 02 sec).

Then, the MEG data were down-sampled to 250Hz and channels with large amplitude, short duration artefacts were identified. Signal-space-separation (SSS) was applied to each session via MaxFilter to remove far-field interference. MaxFilter was also used to apply movement compensation to the MEG data. Channels containing large artefacts were excluded. Two subjects were also excluded. The data set is presented in SPM8 format.

The data set is presented in SPM8 format and can be found in hbaws11.ohba.ox.ac.uk@/home/scratch_disk/hluckhoo/apoe. 

An example script can be found [here](https://sites.google.com/site/ohbaosl/example-data-sets/apoe_analysis_for_dual_reg_paper.m?attredirects=0&d=1). It basically performs source reconstruction (beamforming), Hilbert enveloping and ICA. After performing dual regression, the ICA components are shown on cortical surface. 

## Long resting-state acquisitions

Neuromag data from 10 subjects. (Found on Henry's computer. Not sure where the data came from. Structurals are within a subfolder. - GC.)
`hbaws11.ohba.ox.ac.uk:/home/disk3/hluckhoo/data/fif_files/rest_long`

## Hedonia resting-state data

12 subjects' resting-state data, collected on Neuromag scanner. No sign of structurals - maybe someone knows
- `hbaws11.ohba.ox.ac.uk:/home/disk3/hluckhoo/data/fif_files/hedonia`
- `hbaws11.ohba.ox.ac.uk:/home/disk3/hluckhoo/data/spm_files/hedonia`

## Healthy Volunteers Resting-state and Localizer

A mixed dataset collected in a Neuromag scanner in Oxford and a CTF scanner in Nottingham, with total 7 subjects. 

Each subject had 2-3 sessions of resting-state, followed by a short localizer tapping task designed by Nick Myers. Scans were collected with 2xEOG, ECG, jaw and neck EMG and eyetracker information. 

Data can be found at `hbaws26:/home/gileslc/data/hba2013gk/` in fif, ds and spm format. Structurals are available for all subjects. 

Scan notes are held in a separate subfolder. 

## Schizophrenia Gene ZNF804A

A 50-subject joint fMRI/MEG study run by Helena Cousijn. Narrow age-range, 18-25, most in mid-20s. Subjects selected for presence or absence of ZNF804A. 
Resting-state MEG data can be found at `hbaws17:/home/scratch_disk2/gwallis/resting_freqcorr`

- rawdata contains maxfiltered data (-sst, no -trans, -movecomp)
- Channel 356 of D-object contains a 1 near blinks
- metadata contains noise sections of data in spm 'event' format

Preprocessing scripts in `/home/gwallis/matlab/analysis/PRERE_analysis/preproc_freqcorr`

Metadata in `hbaws26:/home/gileslc/data/Helena/metadata/`

In particular, the Participant_Database file contains behavioural data is from a working memory task in which people had to remember the orientation of 'keyhole' shapes.  'pguess' is the probability a subject was plain guessing on any given trial of our task.  Given there were 4 objects in our working memory array, if you want to estimate working memory capacity, just do `[ (1-pguess)*4 ]`. Kappa is the 'precision' of memory (how fuzzy was their orientation-representation?). Neutral means trials on which there were no cues about which of the memory items was relevant.  Precue means there was a cue in advance of the memory array about which was relevant.  Retrocue means there was a cue half-way through the memory retention interval. The other measures which may be of interest are the 'plain' (i.e. unmodelled) reaction time measures.