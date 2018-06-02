#!/bin/bash

readParameters() {
    if [ $1 ] ; then
        showError "ERROR: You can not provide a LXD name, a lxd file exists"
    fi

    showError "lxd file not managed yet!"
}
