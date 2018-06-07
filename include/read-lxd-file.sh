#!/bin/bash

readParameters() {
    if [ $1 ] ; then
        showError "ERROR: You can not provide a LXD name, a lxd file exists"
    fi

    LXD_NAME=$(grep "^name=" "$FILENAME_TEMPLATE" | cut -d= -f2- | head -1)
    if [ ! "$LXD_NAME" ] ; then
        showError "Template file $FILENAME_TEMPLATE did not contain a name= assignment"
    fi

    LXD_HOSTS=($(grep "^host=" "$FILENAME_TEMPLATE" | cut -d= -f2-))
    if [ ! "$LXD_HOSTS" ] ; then
        LXD_HOSTS=("$LXD_NAME.lxd")
    fi

    LXD_MOUNTS=($(grep "^mount=" "$FILENAME_TEMPLATE" | cut -d= -f2-))

    LXD_DELIVERY_USER=$(grep "^delivery-user=" "$FILENAME_TEMPLATE" | cut -d= -f2- | head -1)
    if [ ! "$LXD_DELIVERY_USER" ] ; then
        LXD_DELIVERY_USER="delivery"
    fi
}
