---
layout: default
title: Download OSL
resource: true
categories: overview
---

The best way to get started with is to take the following steps:

1. Follow the instructions below to download and install OSL
2. Download the [example data](#example-data) available below
2. Run through some of the example scripts (listed on this website, and available in the `examples` folder in OSL)
3. Copy and then adapt a template script to the analysis you want to do.

Please note that we only have limited capacity to provide technical assistance, so OSL is publicly distributed as-is and we provide support on a best-effort basis. 

* TOC
{:toc}

## Prerequisites

- A Mac or Linux computer - FSL/OSL cannot be used on Windows
- Matlab R2014b or newer. 
- FSL should be installed - you can obtain FSL [here](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation).

Matlab R2014b and newer are fully supported. Matlab R2012b-R2014a have basic testing for processing, but there are known graphics incompatibilities. We have not tested functionality for versions of Matlab below R2012b.

## Installation instructions

1. Make sure your Matlab version is R2014b or newer, and that FSL is installed
2. [Download OSL](https://www.dropbox.com/s/428klwuwo7j96tx/osl.tar.gz?dl=0)
3. Once downloaded, extract the contents somewhere convenient. This will create a folder called `osl`
4. Open Matlab and go into the `osl` folder. Within that folder, go into `osl-core`
5. Type `osl_startup` to initialize OSL

For compatibility reasons, OSL includes its own copy of SPM12 and Fieldtrip. If you wish to use current versions of these packages as part of your analysis pipeline, you cannot simultaneously use OSL. To restore your path prior to running OSL, you can call `osl_shutdown`. So for example, if you have a pipeline that uses OSL for preprocessing and Fieldtrip for analysis, run `osl_startup`, perform your preprocessing, then run `osl_shutdown` and continue as normal. 

### Check installation

To verify that your copy of OSL is fully functional, type `osl_check_installation` to test OSL. It is especially important that you verify that an FSLView window appears as part of the test process, because we cannot check this automatically from within Matlab. The test script will create a text file called `osl_debug_log.txt`. Read through the console output or this debug file, which will indicate whether there are any missing packages or system issues that might need resolving.

### Mac OS additional information

- If the “System Information” section of the `osl_debug_log.txt` file indicates that there is no C compiler, you may have to install XCode, which can be done straightforwardly through the Apple App Store though it is quite a large download.
- You may need to [install XQuartz](https://www.xquartz.org) in order for FSLView to work properly

### Configuration options

When you start up OSL for the first time, a file `osl.conf` will be created in your OSL directory (i.e. the path returned by the function `osldir()`). Among other settings, this file contains a list of locations for components of FSL, specifying where the binaries, libraries, and Matlab utilities are located. By default, OSL will look in some standard locations for FSL and use those if FSL is present. If FSL is in an unexpected location, an error will be raised, and you will need to specify the location of FSL manually. Edit `osl.conf` to specify the directories on your system. You can also use this facility to specify which version of FSL you want to use, if you have multiple versions of FSL on your system.

Similarly, you can specify a copy of SPM12 to use. OSL includes its own version of SPM12 because we have made some changes to functions within SPM. Some functions in OSL may not work correctly if you use an unsupported version of SPM, so we do not recommend this.

There are some OSL functions relating to plotting on the cortical surface rely on Workbench. As with FSL, after you have run OSL for the first time, you can edit `osl.conf` to specify the location of Workbench on your system.

### Updating OSL

_WARNING - Updating OSL is **not** recommended. Downloading a new copy is strongly advised_

The various components of OSL are available on GitHub. To update your copy of OSL to the latest code on GitHub, we have provided an upgrade script. From within Matlab, you can run `osl_upgrade`. If this does not work, you can also open a Terminal and run `osl-core/upgrade.sh` manually. Note that parts of the OSL code on GitHub may have changed together with files in `std_masks` or other directories not included on GitHub, and in these cases you may also encounter unexpected behaviour. 

## Example data

OSL comes with several tutorials to illustrate usage. The pages on this website document these, but you can run them yourself using the example scripts included with OSL. 

[Download tutorial data](http://users.fmrib.ox.ac.uk/~woolrich/osl/example_data.tar.gz)

Note that we cannot publicly distribute data for all of the examples due to confidentiality restrictions, so currently it is not possible to run all of the tutorials using the public OSL release. 

