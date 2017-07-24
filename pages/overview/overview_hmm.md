---
layout: default
title: HMM-MAR
resource: true
categories: overview
---

HMM-MAR (Hidden Markov Model - Multivariate Autoregressive) is a toolbox to segment multivariate time series into states that are characterised by their unique quasi-stationary spectral properties. In the context of neuroscience applications, it can be used on both resting and task data. The toolbox comprises a number of additional features:

- Estimation of the spectral properties for each state, using either a parametric (MAR) or a non-parametric approach (statewise multitaper).
- Semi-supervised prediction of events.
- Extension to the classical inference to work with very big data sets.
- Routines for cross-validation and model selection.
- Simulation of data from an HMM-MAR model.
- Sign disambiguation for source reconstructed M/EEG data.

HMM-MAR only requires Matlab and is experimental software. 

Please refer to the [HMM-MAR wiki](https://github.com/OHBA-analysis/HMM-MAR/wiki) for more information and to obtain the code.