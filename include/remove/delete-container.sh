#!/bin/bash

if [[ "$LXD_STATUS" == "RUNNING" ]]; then
    showMessage " > Stop Container"
    sudo lxc stop $LXD_NAME --force > /dev/null
    sleep 1
fi

showMessage " > Delete Container"
sudo lxc delete $LXD_NAME > /dev/null
