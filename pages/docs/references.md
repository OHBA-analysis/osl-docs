---
layout: default
title: References
resource: true
categories: documentation
---

_Moved from Google Sites wiki_

For the beamforming source reconstruction please use a phrase along the lines of 

_Data were source-transformed using a linearly constrained minimum variance beamformer, which combines information over both magnetometers and gradiometers and uses principal component analysis (PCA) to regularize the data covariance matrix estimation and account for the reduction in dimensionality caused by Maxfilter, with a single-shell forward model into MNI space at a 3D gridstep of 6 mm._

and reference:

- Woolrich et al. _MEG beamforming using Bayesian PCA for adaptive data covariance matrix regularization._ Neuroimage (2011) vol. 57 (4) pp. 1466-79

For the trial-wise (first-level) GLM please reference:

- Hunt et al. _Mechanisms underlying cortical activity during value-guided choice._ Nature Neuroscience (2012) vol. 15 (3) pp. 470-6

For the resting state or task ICA analysis, please reference:

- Luckhoo et al. _Inferring task-related networks using independent component analysis in magnetoencephalography._ Neuroimage (2012) vol. 62 (1) pp. 530-41
- Brookes et al. _Investigating the electrophysiological basis of resting state networks using magnetoencephalography._ Proc Natl Acad Sci USA (2011) vol. 108 (40) pp. 16783-8

For the group-level 4D cluster permutation testing, please reference:

- Hunt et al. _Mechanisms underlying cortical activity during value-guided choice._ Nature Neuroscience (2012) vol. 15 (3) pp. 470-6

For the group-level 3D cluster permutation testing (uses FSL), please reference:

- M. Jenkinson et al. _FSL._ NeuroImage, 62:782-90, 2012
- Woolrich et al. _Bayesian analysis of neuroimaging data in FSL._ NeuroImage, 45:S173-86, 2009