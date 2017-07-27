---
layout: default
title: Preprocessing - OPT 
resource: true
categories: documentation
---

OPT (OSL's Preprocessing Tool) is a fully automated pipeline for preprocessing MEG data. This automates as many of the analysis decisions as possible, and allows easy (though still robust, efficient and valid) analysis, whilst giving some flexibility if needed. 

* TOC
{:toc}

OPT runs through the following pipeline steps (some of which can be optionally turned off):

- For _Elekta Neuromag_ data: Runs the "Double [Maxfilter](preprocessing-maxfilter.md) Procedure" (to help Maxfilter with detection of bad channels):
    - Runs Maxfilter without SSS (with some intermediate downsampling to help with disk space/RAM)
    - Conversion of non-SSS data into SPM format
    - Automated detection of bad channels
    - Runs Maxfilter doing SSS (with some intermediate downsampling to help with disk space/RAM)
- Conversion of data into SPM format
- Completes the downsampling
- Automated AFRICA denoising
- High-pass filtering
- Removal of artefact time periods and channels (if continuous data analysis)
- Coregistration and Forward Modelling (needed if intending to do subsequent analysis in source space)
- Epoching _(if epoched data analysis)_
        - Automated outlier trial and channel rejection

An example/template script for calling OPT is called `osl_example_preprocessing_opt.m` and can be found in the OSL matlab directory. This script can easily be adapted to run on your own data.

#### Combining multiple OPT runs (including adding new sessions or re-running subsets of sessions)

A common issue is running OPT separately on different sessions/subjects using separate calls to `osl_run_opt` for each one. This can happen when adding new sessions/subjects, or perhaps when re-running a "problem" session/subject.

For this to work, the key is keep the following `opt` settings fixed over each call to `osl_run_opt`: 

- the `opt.dirname`, and 
- the list of input files (e.g. `opt.raw_fif_files` or `opt.input_files` or `opt.spm_files`), other than concatenating any _new_ sessions on _at the end_.
- the `opt.*.do` settings (e.g. `opt.africa.do`, or `opt.downsample.do`). 

To run OPT on different sessions in different calls to `osl_run_opt`, simple change the `opt.sessions_to_do` for each run. 

When all sessions have been run, you can then use a call to:

    opt=opt_consolidate_results(opt);

This will mine the `opt` directory and combine together the results it can find. It will also produce a consolidated OPT report.

## Data Input

For each subject OPT requires, either (if Elekta Neuromag data):

- the full path of the raw `.fif` files (pre-SSS data) to pass to the Maxfilter

Or (for any data type):

- the full path of the input files that will be passed to the SPM convert function (for Elekta Neuromag data this will be post-SSS `.fif` files

Or (for any data type):

- the full path of the SPM MEEG files for input into SPM (these require `.mat` extensions)

Note that:

- filenames need to be full paths with file extensions (e.g. `.fif`, or `.mat`)

See [Settings](#settings) for more.

## Output

A call to `osl_run_opt`, i.e. 

    opt=osl_run_opt(opt);

returns an `opt` object with a sub-struct named `results` i.e.:

    opt.results

In particular, this contains:

- `opt.results.logfile` (file containing the matlab output) 
- `opt.results.report`: (Web page report with diagnostic plots for each subject)
- `opt.results.spm_files`:  (list of SPM MEEG object files for the continuous data, e.g. to pass into an OAT analysis)
- `opt.results.spm_files_epoched`:  (list of SPM MEEG object files for the epoched data, e.g. to pass into an OAT analysis)

It is highly recommended that you inspect both the `opt.results.logfile` and `opt.results.report`, to ensure that OPT has run successfully.

## Running the Analysis

The OPT structure should be passed to the function `osl_run_opt.m`, to run the pipeline.

## Settings

The `opt` settings need to be in an OPT structure (e.g. called `opt`) that needs to be setup with a call to the `osl_check_opt.m` function (with the required settings have been setup in the OPT structure - see below). 

`osl_check_opt.m `will check the settings, and will throw an error if any required inputs are missing, and will fill other settings that are not passed in with their default values. The OPT structure can then be passed to `osl_run_opt` to do an OPT analysis.

#### Required inputs

The required inputs for `osl_check_opt.m` are:

- `opt.raw_fif_files`: A list of the existing raw fif files for subjects (need these if want to do SSS Maxfiltering), e.g.:
    - `raw_fif_files{1}=[testdir '/fifs/sub1_face']; `
    - `raw_fif_files{2}=[testdir '/fifs/sub2_face']; `
    - etc...

OR:

- `opt.input_files`: A list of the base input (e.g. fif) files for input into the SPM convert call, e.g.:
    - `input_files{1}=[testdir '/fifs/sub1_face_sss'];`
    - `input_files{2}=[testdir '/fifs/sub2_face_sss'];`
    - etc...

AND:

- `opt.datatype`: Specifies the datatype; i.e. `neuromag`, `ctf`, `eeg`; e.g. 
    - `opt.datatype='neuromag'`;

#### Optional inputs

See inside this function (e.g. use `type osl_check_opt.m`) to see the other optional settings, or just look at the fields in the output OPT structure! 