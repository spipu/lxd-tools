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

showMessage "Clean knowhosts file"
ssh-keygen -R "$LXD_HOST" > /dev/null
ssh-keygen -R "$LXD_IP"   > /dev/null

showMessage "Clean /etc/hosts file"
sudo sed -i "/$LXD_HOST/d" /etc/hosts
sudo sed -i "/$LXD_IP/d" /etc/hosts

showMessage "Stop Container"
sudo lxc exec $LXD_NAME -- shutdown -h now
sleep 1

showMessage "Delete Container"
sudo lxc delete $LXD_NAME

showMessage "Container List"
sudo lxc list

showMessage "Finished"

