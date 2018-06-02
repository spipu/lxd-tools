#!/bin/bash

readParameters() {
    if [ -z $1 ] ; then
        showError "ERROR: You must provide a LXD name"
    fi

    LXD_NAME="$1"
    LXD_HOST="${LXD_NAME}.lxd"
}
