#!/bin/bash
WORKDIR="SDK11"
SDK_CONFIG_FILE="processor-sdk-scarthgap-chromium-11.02.08.02-config.txt"
git clone https://git.ti.com/git/arago-project/oe-layersetup.git ${WORKDIR} && cd ${WORKDIR}
./oe-layertool-setup.sh -f configs/processor-sdk/${SDK_CONFIG_FILE}


