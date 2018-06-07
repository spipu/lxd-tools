#!/bin/bash

# Get the current execution user
CURRENT_USER=`whoami`
if [ "$CURRENT_USER" == "root" ]; then
    showError "You must not execute this script as root user."
fi

# The user must have a RSA ssh key
CURRENT_USER_SSH_KEY=$(readlink -f ~/.ssh/id_rsa.pub)
if [ ! -f $CURRENT_USER_SSH_KEY ]; then
    showError "You must have a public ssh RAS key in $CURRENT_USER_SSH_KEY"
fi

# Get the current execution folder
CURRENT_FOLDER=`pwd`
FILENAME_TEMPLATE="$CURRENT_FOLDER/lxdfile"

# Default Parameters
LXD_NAME=""
LXD_HOSTS=()
LXD_MOUNTS=()
LXD_DELIVERY_USER=""
LXD_IP=""