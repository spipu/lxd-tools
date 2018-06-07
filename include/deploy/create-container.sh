#!/bin/bash

showMessage " > Create Container"
sudo lxc launch images:debian/stretch $LXD_NAME > /dev/null

showMessage " > Waiting for IP"

while [ ! "$LXD_IP" ] ; do
    LXD_IP=`sudo lxc list $LXD_NAME --format csv -c 4 | cut -d' ' -f1`
done

showMessage "  - $LXD_IP"