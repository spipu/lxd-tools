#!/bin/bash

SCRIPT_DIR=`dirname "$(readlink -f $0)"`
source ${SCRIPT_DIR}/include/init.sh

showWarning "Create the following container"
showMessage "  - name:          $LXD_NAME"
showMessage "  - host:          $LXD_HOST"
showMessage "  - delivery user: $LXD_DELIVERY_USER"

if [ -d "$LXD_FOLDER" ]; then
    showError "The asked container already exits"
fi

source $INCLUDE_DIR/deploy/create-container.sh
source $INCLUDE_DIR/deploy/add-to-etc-hosts.sh
source $INCLUDE_DIR/deploy/upgrade.sh
source $INCLUDE_DIR/deploy/configure-ssh.sh
source $INCLUDE_DIR/deploy/add-to-knowhosts.sh
source $INCLUDE_DIR/deploy/test.sh

showWarning "Finished"
