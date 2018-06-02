#!/bin/bash

readParameters() {
    if [ $1 ] ; then
        showError "ERROR: You can not provide a LXD name, a lxd file exists"
    fi

    LXD_NAME=$(grep "^name=" "$FILENAME_TEMPLATE" | cut -d= -f2- | head -1)
    if [ ! "$LXD_NAME" ] ; then
        showError "Template file $FILENAME_TEMPLATE did not contain a name= assignment"
    fi

    LXD_HOST=$(grep "^host=" "$FILENAME_TEMPLATE" | cut -d= -f2- | head -1)
    if [ ! "$LXD_HOST" ] ; then
        LXD_HOST="$LXD_NAME.lxd"
    fi
}
