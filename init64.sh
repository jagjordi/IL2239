## Sample file for setting the environment for LFoundry PDK using bash
##
## If there is a "N/A", it could not be determined correctly during
## installation. Please fix it.
##

# KTH lincense server
export LM_LICENSE_FILE=5280@lic08.ug.kth.se

editor="/path_to_editor"

## ASSURAHOME
## Directory of the Assura installation
#export ASSURAHOME="N/A"
#export ASSURAHOME=/pkg/cadence/installs/ASSURA41
export ASSURAHOME=/afs/kth.se/pkg/designkits/ekt/cdc/installs/ASSURA41
export PATH=$PATH:$ASSURAHOME/tools/bin:$ASSURAHOME/tools/assura/bin
export ASSURA_AUTO_64BIT=ALL

## CDSHOME
## Directory of the Cadence DFII installation
#export CDSHOME="N/A"
#export CDSHOME=/pkg/cadence/installs/IC615
export CDSHOME=/afs/kth.se/pkg/designkits/ekt/cdc/installs/IC615
export PATH=$PATH:$CDSHOME/tools/bin:$CDSHOME/tools/dfII/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MMSIM_HOME}/tools/lib/64bit:${MMSIM_HOME}/tools/lib:${CDSHOME}/tools/dfII/lib/64bit:${CDSHOME}/tools/dfII/lib
export CDS_AUTO_64BIT=ALL

## MMSIM_HOME
#export MMSIM_HOME=/pkg/cadence/installs/MMSIM72
export MMSIM_HOME=/afs/kth.se/pkg/designkits/ekt/cdc/installs/MMSIM141
export PATH=$PATH:$MMSIM_HOME/tools/bin
export CDS_AHDLCMI_ENABLE=NO

# QRC_HOME
## Directory of the stand-alone QRC
#export QRC_HOME=/pkg/cadence/installs/EXT91
export QRC_HOME=/afs/kth.se/pkg/designkits/ekt/cdc/installs/EXT91
export PATH=$PATH:$QRC_HOME/tools/bin
export QRC_ENABLE_EXTRACTION="t"


## CDS_Netlisting_Mode
## Interpretion of CDF properties during netlisting
export CDS_Netlisting_Mode="Analog"

## DD_USE_LIBDEFS
## Ignore lib.defs and use cds.lib only (if set to "no")
export DD_USE_LIBDEFS="no"

## LF150_DISPLAY
## display.drf load mechanism; load directly from PDK if set to "true", load from work dir if "false" or not set at all
export LF150_DISPLAY="true"

## LF150_HOME
## Directory of the PDK installation
#export LF150_HOME="/pkg/pdk/PDK_LF150i_V2_0_0"
export LF150_HOME="/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY/PDK_LF150i_V2_0_0"

## LF150_OPTION
## PDK installation module option
export LF150_OPTION="6metal"

## LF_PDF_READER
## The pdf reader executable
export LF_PDF_READER="acroread"

## LF_PDF_READER_HOME
## Directory to the pdf reader executable defined by LF_PDF_READER
export LF_PDF_READER_HOME="/usr/bin"

## MGC_HOME
## Directory of the Calibre installation
#export MGC_HOME="N/A"


##
## Following variables are used for the Ciranova plug in
##

## CNI_ROOT
## Root path of CNI plug in; select according DFII installation
export CNI_ROOT="${LF150_HOME}/tools/plugins/ciranova_plugin_linux_rhel30_gcc411_64_4.4.2_I6"

## CNI_PLAT_ROOT
## Path for plug in; select according DFII installation
export CNI_PLAT_ROOT="${CNI_ROOT}/plat_linux_gcc411_64"

## Following variables need no change
export CNI_LOG_DEFAULT="/dev/null"
export LD_LIBRARY_PATH="${CNI_PLAT_ROOT}/3rd/lib:${CNI_PLAT_ROOT}/lib:${LD_LIBRARY_PATH}"
export OA_COMPILER="gcc411"
export OA_PLUGIN_PATH="${CNI_ROOT}/quickstart"
export PATH="${CNI_PLAT_ROOT}/3rd/bin:${CNI_PLAT_ROOT}/bin:${CNI_ROOT}/bin:${PATH}"
export PYTHONHOME="${CNI_PLAT_ROOT}/3rd"
export PYTHONPATH="${CNI_ROOT}/pylib:${CNI_PLAT_ROOT}/lib:${PYTHONPATH}"

# Set INCISIVE tools #
export IUSDIR=/afs/kth.se/pkg/designkits/ekt/cdc/installs/INCISIVE142
export PATH=$PATH:$IUSDIR/tools/bin/64bit:$IUSDIR/tools/bin
export CDS_BIND_TMP_DD=true

