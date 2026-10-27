#!/bin/bash
set -e

LXD_MODE="info"

SCRIPT_DIR=`dirname "$(readlink -f $0)"`
source ${SCRIPT_DIR}/include/init.sh

showWarning "Info of the following container"
showResume

if [ ! -d "$LXD_FOLDER" ]; then
    showError "The asked container does not exist"
fi

showMessage " > Status"
LXD_STATUS=$(sudo lxc list "^$LXD_NAME\$" --format csv -c s)
showMessage "  - $LXD_STATUS"

source $INCLUDE_DIR/common/read-lxd-info.sh

showMessage " > Content of /root/lxd-info"
echo "$LXD_INFO"
