## Sample file for setting the environment for LFoundry PDK using csh
##
## If there is a "N/A", it could not be determined correctly during
## installation. Please fix it.
##

## ASSURAHOME
## Directory of the Assura installation
#setenv ASSURAHOME "N/A"

## CDSHOME
## Directory of the Cadence DFII installation
#setenv CDSHOME "N/A"

## CDS_Netlisting_Mode
## Interpretion of CDF properties during netlisting
setenv CDS_Netlisting_Mode "Analog"

## DD_USE_LIBDEFS
## Ignore lib.defs and use cds.lib only (if set to "no")
setenv DD_USE_LIBDEFS "no"

## LF150_DISPLAY
## display.drf load mechanism; load directly from PDK if set to "true", load from work dir if "false" or not set at all
setenv LF150_DISPLAY "true"

## LF150_HOME
## Directory of the PDK installation
setenv LF150_HOME "./PDK_LF150i_V2_0_0"

## LF150_OPTION
## PDK installation module option
setenv LF150_OPTION "6metal"

## LF_PDF_READER
## The pdf reader executable
#setenv LF_PDF_READER "acroread"

## LF_PDF_READER_HOME
## Directory to the pdf reader executable defined by LF_PDF_READER
#setenv LF_PDF_READER_HOME "N/A"

## MGC_HOME
## Directory of the Calibre installation
#setenv MGC_HOME "N/A"

## QRC_HOME
## Directory of the stand-alone QRC
#setenv QRC_HOME "N/A"


##
## Following variables are used for the Ciranova plug in
##

## CNI_ROOT
## Root path of CNI plug in; select according DFII installation
setenv CNI_ROOT ${LF150_HOME}/tools/plugins/ciranova_plugin_linux_rhel30_gcc411_32_4.4.2_I6

## CNI_PLAT_ROOT
## Path for plug in; select according DFII installation
setenv CNI_PLAT_ROOT ${CNI_ROOT}/plat_linux_gcc411_32

## Following variables need no change
setenv CNI_LOG_DEFAULT "/dev/null"
if( $?LD_LIBRARY_PATH ) then
  setenv LD_LIBRARY_PATH "${CNI_PLAT_ROOT}/3rd/lib:${CNI_PLAT_ROOT}/lib:${LD_LIBRARY_PATH}"
else
  setenv LD_LIBRARY_PATH "${CNI_PLAT_ROOT}/3rd/lib:${CNI_PLAT_ROOT}/lib"
endif
setenv OA_COMPILER "gcc411"
setenv OA_PLUGIN_PATH "${CNI_ROOT}/quickstart"
if( $?PATH ) then
  setenv PATH "${CNI_PLAT_ROOT}/3rd/bin:${CNI_PLAT_ROOT}/bin:${CNI_ROOT}/bin:${PATH}"
else
  setenv PATH "${CNI_PLAT_ROOT}/3rd/bin:${CNI_PLAT_ROOT}/bin:${CNI_ROOT}/bin"
endif
setenv PYTHONHOME "${CNI_PLAT_ROOT}/3rd"
if( $?PYTHONPATH ) then
  setenv PYTHONPATH "${CNI_ROOT}/pylib:${CNI_PLAT_ROOT}/lib:${PYTHONPATH}"
else
  setenv PYTHONPATH "${CNI_ROOT}/pylib:${CNI_PLAT_ROOT}/lib"
endif
