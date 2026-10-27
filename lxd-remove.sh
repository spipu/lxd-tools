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

showMessage " > Status"
LXD_STATUS=$(sudo lxc list "^$LXD_NAME\$" --format csv -c s)
showMessage "  - $LXD_STATUS"

source $INCLUDE_DIR/common/read-lxd-info.sh

showMessage " > Search IP"
if [[ "$LXD_STATUS" == "RUNNING" ]]; then
    LXD_IP=$(sudo lxc list "^$LXD_NAME\$" --format csv -c 4 | cut -d' ' -f1)
fi
if [[ ! "$LXD_IP" ]]; then
    LXD_IP="$LXD_INFO_IP"
fi
if [[ ! "$LXD_IP" ]]; then
    showWarning "  - ip not found"
else
    showMessage "  - $LXD_IP"
fi
if [[ "$LXD_INFO_IP" ]] && [[ "$LXD_INFO_IP" != "$LXD_IP" ]]; then
    showWarning "  - ip in /root/lxd-info is different: $LXD_INFO_IP (both will be cleaned)"
fi

showMessage " > Search template name"
LXD_TEMPLATE_NAME=$(echo "$LXD_INFO" | grep "^template=" | cut -d= -f2- | head -1)
if [[ ! "$LXD_TEMPLATE_NAME" ]]; then
    showWarning "  - template not found in /root/lxd-info"
else
    showMessage "  - $LXD_TEMPLATE_NAME"
    if [[ ! -f "$TEMPLATE_DIR/$LXD_TEMPLATE_NAME.sh" ]]; then
        showError "This template name does not exists"
    fi
    source $TEMPLATE_DIR/$LXD_TEMPLATE_NAME.sh
fi

source $INCLUDE_DIR/remove/is-deprecated.sh
source $INCLUDE_DIR/remove/clean-knowhosts.sh
source $INCLUDE_DIR/common/clean-etc-hosts-entries.sh
source $INCLUDE_DIR/remove/delete-container.sh
source $INCLUDE_DIR/remove/test.sh

showWarning "Finished"
