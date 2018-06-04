#!/bin/bash

INCLUDE_DIR="$SCRIPT_DIR/include"
TEMPLATE_DIR="$SCRIPT_DIR/template"

# Generic Includes
source $INCLUDE_DIR/init-vars.sh
source $INCLUDE_DIR/messages.sh

# Do we have a lxd file or not ?
if [ -f "$FILENAME_TEMPLATE" ]; then
    source $INCLUDE_DIR/read-lxd-file.sh
else
    source $INCLUDE_DIR/read-user-entry.sh
fi

# Read the paramters (from lxdfile or user entry)
readParameters $1

# Validate the lxd name
LXD_NAME=$(echo $LXD_NAME | tr 'A-Z' 'a-z')
LXD_NAME_PROTECT=$(echo $LXD_NAME | tr -d 'a-z0-9-')
if [ "$LXD_NAME_PROTECT" != "" ]; then
    showError "Your LXD name is not valid. Use only alphanum, minus chars."
fi

# LXD folder
LXD_FOLDER="/var/lib/lxd/storage-pools/default/containers/$LXD_NAME"
