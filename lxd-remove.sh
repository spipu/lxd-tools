#!/bin/bash

SCRIPT_DIR=`dirname "$(readlink -f $0)"`
source ${SCRIPT_DIR}/include/init.sh

showWarning "Remove the following container"
showMessage "  - name:          $LXD_NAME"
showMessage "  - host:          $LXD_HOST"
showMessage "  - delivery user: $LXD_DELIVERY_USER"

if [ ! -d "$LXD_FOLDER" ]; then
    showError "The asked containter does not exist"
fi

LXD_IP=`sudo lxc list $LXD_NAME --format csv -c 4 | cut -d' ' -f1`

source $INCLUDE_DIR/remove/clean-knowhosts.sh
source $INCLUDE_DIR/remove/clean-etc-hosts.sh
source $INCLUDE_DIR/remove/delete-container.sh
source $INCLUDE_DIR/remove/test.sh

showWarning "Finished"
