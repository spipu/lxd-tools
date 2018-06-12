#!/bin/bash

showMessage " > Add Mounts"

for LXD_MOUNT in ${LXD_MOUNTS[@]}; do
    MOUNT_SRC=${LXD_MOUNT%%:*}
    MOUNT_DST=${LXD_MOUNT##*:}

    if echo "$MOUNT_SRC" | grep -q ^~/ ; then
        MOUNT_SRC="$CURRENT_USER_HOME/${MOUNT_SRC#~/}"
    elif ! echo "$MOUNT_SRC" | grep -q ^/ ; then
        MOUNT_SRC="$CURRENT_FOLDER/$MOUNT_SRC"
    else
        MOUNT_SRC="$MOUNT_SRC"
    fi

    if [ ! -d "$MOUNT_SRC" ] ; then
        showError "Error on mount entry for non-existent directory $MOUNT_SRC"
    fi

    MOUNT_SRC_MD5=$(echo "$MOUNT_SRC" | md5sum | cut -d' ' -f1)
    MOUNT_DEVICE="${MOUNT_SRC_MD5}Device"
    showMessage "  - $MOUNT_SRC => $MOUNT_DST in $MOUNT_DEVICE"

#    sudo lxc exec $LXD_NAME -- mkdir -p "$MOUNT_DST"
    sudo lxc config device add $LXD_NAME ${MOUNT_DEVICE} disk source="$MOUNT_SRC" path="$MOUNT_DST" > /dev/null
done
