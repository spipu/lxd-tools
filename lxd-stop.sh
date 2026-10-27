#!/bin/bash
set -e

LXD_MODE="stop"

SCRIPT_DIR=`dirname "$(readlink -f $0)"`
source ${SCRIPT_DIR}/include/init.sh

showWarning "Stop the following container"
showResume

if [ ! -d "$LXD_FOLDER" ]; then
    showError "The asked container does not exist"
fi

LXD_STATUS=$(sudo lxc list "^$LXD_NAME\$" --format csv -c s)
if [[ "$LXD_STATUS" != "RUNNING" ]]; then
    showError "The asked container is not running ($LXD_STATUS)"
fi

showWarning "Started"

source $INCLUDE_DIR/common/read-lxd-info.sh
source $INCLUDE_DIR/common/clean-etc-hosts-entries.sh

showMessage " > Stop Container"
sudo lxc stop $LXD_NAME > /dev/null

showMessage " > Container List"
sudo lxc list -c ns4tS

showWarning "Finished"
