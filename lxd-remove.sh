#!/bin/bash
set -e

LXD_MODE="remove"

SCRIPT_DIR=`dirname "$(readlink -f $0)"`
source ${SCRIPT_DIR}/include/init.sh

showWarning "Remove the following container"
showResume

if [ ! -d "$LXD_FOLDER" ]; then
    showError "The asked containter does not exist"
fi

showWarning "Started"

showMessage " > Search IP"
LXD_IP=$(sudo lxc list "^$LXD_NAME\$" --format csv -c 4 | cut -d' ' -f1)
if [[ ! "$LXD_IP" ]]; then
  showError "Failed to find the ip"
fi
showMessage "  - $LXD_IP"

source $INCLUDE_DIR/remove/clean-knowhosts.sh
source $INCLUDE_DIR/remove/clean-etc-hosts.sh
source $INCLUDE_DIR/remove/delete-container.sh
source $INCLUDE_DIR/remove/test.sh

showWarning "Finished"
