#!/bin/bash

showMessage " > Create Container"
sudo lxc launch images:$LXD_TEMPLATE_IMAGE $LXD_NAME > /dev/null

showMessage " > Configure Container"

sudo lxc config set $LXD_NAME raw.idmap "both $CURRENT_USER_UID $CURRENT_USER_UID"
sudo lxc restart $LXD_NAME

showMessage " > Waiting for IP"

while [ ! "$LXD_IP" ] ; do
    LXD_IP=`sudo lxc list $LXD_NAME --format csv -c 4 | cut -d' ' -f1`
done

showMessage "  - $LXD_IP"