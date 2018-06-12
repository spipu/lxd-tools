#!/bin/bash

# Do we have a lxd file or not ?
if [ -f "$FILENAME_TEMPLATE" ]; then
    source $INCLUDE_DIR/read-lxd-file.sh
else
    source $INCLUDE_DIR/read-user-entry.sh
fi

# Validate the lxd name
LXD_NAME=$(echo $LXD_NAME | tr 'A-Z' 'a-z')
LXD_NAME_PROTECT=$(echo $LXD_NAME | tr -d 'a-z0-9-')
if [ "$LXD_NAME_PROTECT" != "" ]; then
    showError "Your LXD name is not valid. Use only alphanum, minus chars."
fi

# LXD folder
LXD_FOLDER="/var/lib/lxd/storage-pools/default/containers/$LXD_NAME"
