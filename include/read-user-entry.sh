#!/bin/bash

readParameters() {
    if [ -z $1 ] ; then
        showError "ERROR: You must provide a LXD name"
    fi

    LXD_NAME="$1"
    LXD_HOSTS=("$LXD_NAME.lxd")
    LXD_MOUNTS=()
    LXD_DELIVERY_USER="delivery"
}
