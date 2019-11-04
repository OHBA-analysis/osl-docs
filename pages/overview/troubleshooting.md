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

#### FSLView doesn't start on Mac OS 10.12

Update XQuartz to the latest version.

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

#### Mac OS additional information

If the “System Information” section of the `osl_debug_log.txt` file indicates that there is no C compiler, you may have to install XCode, which can be done straightforwardly through the Apple App Store though it is quite a large download.

You may also need to [install XQuartz](https://www.xquartz.org) in order for FSLView to work properly.

#### FieldTrip mex errors

To recompile Fieldtrip, start up OSL, and then run

	osl_recompile_fieldtrip

If the problem is in `ft_getopt` it is also fine to just delete the MEX file i.e.

	osl/spm12/external/fieldtrip/utilities/ft_getopt.mexmaci64

On recent versions of Matlab, there is essentially no performance advantage from using the compiled version of this function.

#### SPM crashes or hangs

If you experience unexpected behaviour in SPM e.g. it hangs when you try to load an MEEG object, you may need to recompile the MEX files. To do this, in a terminal go into your SPM directory and then

	cd spm12/src
	make distclean
	make && make install
	make external-distclean
	make external && make external-install

This will also recompile FieldTrip