---
layout: default
title: Troubleshooting
resource: true
categories: overview
---

* TOC
{:toc}

#### Check your installation

To verify that your copy of OSL is fully functional, type `osl_check_installation` to test OSL. It is especially important that you verify that an FSLView window appears as part of the test process, because we cannot check this automatically from within Matlab. The test script will create a text file called `osl_debug_log.txt`. Read through the console output or this debug file, which will indicate whether there are any missing packages or system issues that might need resolving.

#### FSL paths

OSL will not start properly without FSL installed and properly [configured]({{ site.baseurl }}/pages/overview/download.html#step-3-configure-osl-paths).
See [https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation) for instructions to install FSL. 

#### Compiling MEX files on OSX

Compiling MEX files is significantly more troublesome on OSX than on Linux, because it requires Xcode to be installed.

Check for compatible Xcode versions depdending on your Matlab version at [this link](https://uk.mathworks.com/support/requirements/previous-releases.html) (column "Supported Compilers"), and download a suitable version [here](https://developer.apple.com/download/more/?=xcode) (requires an Apple ID). This is a very large archive, and may take several hours to download, so make sure you have a good Internet connection.

Once the download is finished, go through the installation process and make sure to accept the license. 
If needed, you can manually accept the license by typing in a terminal: `sudo xcodebuild -license` 

You can check that Xcode is installed by opening `Finder > Applications` and looking for "Xcode.app" (blue icon with a hammer).

#### MEX errors on Ubuntu

If you run into errors of the type _"GLIBCXX symbols not found"_ when calling MEX functions, this might be due to a mismatch between the C/C++ libraries built into Matlab, and your system's. The fix for [this bug](https://uk.mathworks.com/support/bugreports/1297894) may prevent such issues.

#### Compiling SPM and FieldTrip

If you experience unexpected behaviour in SPM e.g. it hangs when you try to load an MEEG object, you may need to recompile the MEX files (see the [required setup](#compiling-mex-files-on-osx) on OSX). 
To do this, open a terminal into the folder `osl/spm12/src` and follow the instructions for your platform:

- Instructions for compiling on Linux: [here](https://en.wikibooks.org/wiki/SPM/Installation_on_64bit_Linux#Compilation)
- Instructions for compiling on OSX: [here](https://en.wikibooks.org/wiki/SPM/Installation_on_64bit_Mac_OS_(Intel)#Compilation)

> **Note:**
>
> Prior to running these steps, you should ensure that the Matlab binaries are on your path:
> ```
> export PATH=$MATLABROOT/bin:$PATH
> ```
>
> where `$MATLABROOT` corresponds to the output of command `matlabroot()` within Matlab; typical locations are `/Applcations/MATLAB_R2018b.app` on OSX, or `/opt/MATLAB/R2018b` on Linux for example.

#### FieldTrip MEX errors

To recompile Fieldtrip, start up OSL, and then run

	osl_recompile_fieldtrip

If the problem is in `ft_getopt` it is also fine to just delete the MEX file i.e.

	osl/spm12/external/fieldtrip/utilities/ft_getopt.mexmaci64

On recent versions of Matlab, there is essentially no performance advantage from using the compiled version of this function.

---

#### FSLView doesn't start on Mac OS 10.12

Update XQuartz to the latest version.

#### Using FSLview on Mac OSX

You will need to [install XQuartz](https://www.xquartz.org) in order for FSLView to work properly.

#### FSLVIEW appears offscreen on Mac OS

It's possible for FSLView to appear off the screen, if an external monitor was previously used and is now not present (or vice versa). If the title bar is not visible, it may not be possible to reposition the window, rendering FSLView unusable. We have included an app to fix this. 

1. Open the Mac OS 'System Preferences', click 'Security and Privacy', and click 'Accessibility' in the list on the left side of the window
2. Unlock the preferences by clicking the lock icon in the bottom left of the window (may not be necessary depending on your machine)
3. Press the '+' button to add a new app to the list of permitted apps. Navigate to your `osl2` directory, then go into `util` and select `fix_fslview.app`
4. Open FSL, either by typing `fslview` in the terminal if your system paths are set up correctly, or in Matlab, type

	p = parcellation(8)
	p.fslview

5. Once FSLView is opened (i.e. the icon has appeared in the dock, even if the FSLView window is located offscreen), double click `fix_fslview.app`
6. The FSLView window should now be repositioned on your screen