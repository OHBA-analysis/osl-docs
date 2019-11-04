---
layout: default
title: Download OSL
resource: true
categories: overview
---

OSL consists of a set of repositories available from the [OHBA Analysis on GitHub](https://github.com/OHBA-analysis):

- `osl-core` and `ohba-external` contain the main Matlab scripts, and external dependencies;
- The toolboxes `HMM-MAR`, `GLEAN` and `MEG-ROI-nets` provide additional analysis tools.

OSL is built around `SPM12` and `FSL`. There are two main archives to be downloaded, and an additional archive containing data for the examples:

- [`osl.tar.gz`]({{ site.downloadurl }}/osl.tar.gz) contains the repositories mentioned above as static sources (see [how to](#using-git-repositories) convert them to git repositories);
- [`release_supplements.tar.gz`]({{ site.downloadurl }}/release_supplements.tar.gz) contains supporting folders required by OSL, and packaged separately to facilitate manual updates;
- (optional) [`example_data.tar.gz`]({{ site.downloadurl }}/example_data.tar.gz) contains the data used for the tutorials available on this website (menu "Examples").

The installation instructions can be found below.
Please note that we only have limited capacity to provide technical assistance, so OSL is publicly distributed as-is and we provide support on a best-effort basis. 
See also the [troubleshooting]({{ site.baseurl }}/pages/overview/troubleshooting.html) page.

* TOC
{:toc}

---

## Requirements

- A Mac or Linux computer - FSL/OSL cannot be used on Windows
- Matlab R2014b or newer. 
- FSL should be installed - you can obtain FSL [here](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation).
- On OSX, [XQuartz](https://www.xquartz.org) should be installed

Matlab R2014b and newer are fully supported. Matlab R2012b-R2014a have basic testing for processing, but there are known graphics incompatibilities. We have not tested functionality for versions of Matlab below R2012b.

Optionally, some scripts require [Connectome Workbench](https://www.humanconnectome.org/software/get-connectome-workbench) to be installed. See [below](#step-3-configure-osl-paths) how to configure OSL to use `wb_command`.

## Installation instructions

Before moving on to the first step, make sure your Matlab version is R2014b or newer, that FSL is installed, and that XQuartz is installed if you are on OSX (see requirements).
In particular, typing `echo $FSLDIR` in a terminal should return the path to the FSL folder on your machine.

#### Step 1: download sources

Open a terminal into a convenient folder to install OSL (e.g. `$HOME/Documents/MATLAB`), and type:

    curl -O "{{ site.downloadurl }}/osl.tar.gz"
    curl -O "{{ site.downloadurl }}/release_supplements.tar.gz"

    tar xzf osl.tar.gz
    tar xzf release_supplements.tar.gz --strip-components=1 --directory=osl

_(Note: you can also use `wget` instead of `curl -O` if needed.)_

This should create a folder called `osl` with the following contents:

    osl/
    ├── GLEAN/
    ├── HMM-MAR/
    ├── layouts/
    ├── MEG-ROI-nets/
    ├── ohba-external/
    ├── osl-core/
    ├── parcellations/
    ├── spm12/
    ├── std_masks/
    └── version.txt

> **Tip:** the command `osldir()`, which is used in many scripts within OSL, refers to the root folder `osl`, and not to the subfolder `osl-core`.

#### Step 2: configure OSL paths

Complete the installation of OSL by opening Matlab, navigate to the subfolder `osl/osl-core`, and type `osl_startup`.

The first time that this command is run, a file called `osl.conf` will be created in the `osl` folder. 
This file contains a list of paths used by OSL to determine the location of various binaries, libraries, sources and Matlab utilities. 
An empty version of this file might look like this:

    FSLDIR = 
    FSLBIN = 
    FSLLIB = 
    WORKBENCH = 
    SPMDIR = 

It is recommended to specify these paths manually prior to using OSL, by editing this file.

By default, OSL will look for FSL components in a few standard locations, and raise an error if they cannot be found. 
The default SPM folder is that packaged in the supplementary archive, and the use of Workbench is disabled by default, unless a path is specified.

Although it is possible to specify your own version of SPM, we strongly discourage doing so, because several changes were introduced in the version provided with OSL, and we cannot guarantee the behaviour of OSL functions without that version.

Finally, some OSL functions for plotting on the cortical surface rely on [Connectome Workbench](https://www.humanconnectome.org/software/get-connectome-workbench). 
If you need to use them, you will need to specify the location of the Workbench folder on your system (the one that contains a folder named `bin_linux64` or similar).

---

## SPM and FieldTrip

For compatibility reasons, OSL includes its own copy of SPM12 and Fieldtrip. 
Both come with Mex files that are pre-compiled, but if you run into errors, you might need to re-compile them manually your machine. 
More information about this is available in the corresponding [troubleshooting section]({{ site.baseurl }}/pages/overview/troubleshooting.html#spm-and-fieldtrip).

If you wish to use your own versions of these packages as part of your analysis pipeline, you cannot simultaneously use OSL. However, you can always restore your Matlab path after using OSL by calling `osl_shutdown`. For example, if you have a pipeline that uses OSL for preprocessing and Fieldtrip for analysis:

- run `osl_startup` to use OSL, 
- perform your preprocessing, 
- then run `osl_shutdown` and continue as normal. 

## Tutorial data

OSL comes with several tutorials to illustrate usage, and we encourage users to copy and adapt these tutorials for their own analysis.
The scripts are located in the folder `osl/osl-core/examples`, and expected outputs can be found in the "Examples" menu on this website.

In order to run the tutorials yourself, you will need to download the [tutorial data]({{ site.downloadurl }}/example_data.tar.gz), and extract it as a folder `osl/example_data`.
Be aware that this archive contains several GB of data, so a good connection is needed for this download (using `wget` or `curl` from a console may also be preferrable). 

Note that we cannot publicly distribute all of the data for the tutorials due to confidentiality restrictions, so currently some of the tutorials cannot be run locally using the public OSL release.

## Using git repositories

The OSL sources distributed in the archive above are static; they are merely snapshots of the repositories that can be found [on GitHub](https://github.com/OHBA-analysis).
However, it is possible to transform these static folders into git repositories. This may be useful for:

- Updating the various packages to the latest available versions with a single command.
- Contributing your own improvements or bug fixes. You may be interested to [read more](https://guides.github.com/activities/forking/) about forks and pull-requests.

In order to transform the static folders into git repositories, simply run:

    cd osl/osl-core
    ./git-replace.sh

> **Warning!** 
> This will **delete everything** within the main OSL sources folders, and replace them with freshly cloned repositories. Make sure to backup any important modifications, files or data that was saved manually into these folders prior to running these commands.

## Updating OSL

Partial updates of OSL (e.g. updating only a certain toolbox, or only the supplementary folders) is generally strongly discouraged, as it can introduce breaking changes and cause unexpected behaviour that may be difficult to debug. The simplest and recommended way to update OSL is to download a new copy, and to follow the installation procedure described above.

Nevertheless, it is also possible to update parts of OSL more regularly if you want to stay at the edge:

1. Updating the sources (folders `osl-core`, `ohba-external`, and toolboxes) can be done by converting these folders into git repositories -- as described in the previous section -- and calling the script `./git-update.sh` from the folder `osl/osl-core`.

2. It is also possible to update the supplementary folders manually by downloading the [latest archive]({{ site.downloadurl }}/release_supplements.tar.gz). To avoid unexpected errors, make sure to delete the old folders before replacing them with the new ones, instead of merging the two.
