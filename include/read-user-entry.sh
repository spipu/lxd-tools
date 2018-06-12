#!/bin/bash

readParameters() {
    if [ -z $1 ] ; then
        showError "ERROR: You must provide a LXD name"
    fi

    if [ -z $2 ] ; then
        showError "ERROR: You must provide a template name"
    fi

    LXD_NAME="$1"
    LXD_TEMPLATE_NAME="$2"
    LXD_HOSTS=("$LXD_NAME.lxd")
    LXD_MOUNTS=()
    LXD_DELIVERY_USER="delivery"
}
