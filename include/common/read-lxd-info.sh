#!/bin/bash

showMessage " > Read /root/lxd-info"

LXD_INFO=$(sudo lxc file pull $LXD_NAME/root/lxd-info - 2> /dev/null || true)
if [[ ! "$LXD_INFO" ]]; then
    showWarning "  - file /root/lxd-info not found in the container"
fi

LXD_INFO_IP=$(echo "$LXD_INFO" | grep "^ip=" | cut -d= -f2- | head -1)
showMessage "  - ip: $LXD_INFO_IP"

LXD_INFO_HOSTS=($(echo "$LXD_INFO" | grep "^host=" | cut -d= -f2-))
if [ "$LXD_INFO_HOSTS" ] ; then
    LXD_HOSTS=("${LXD_INFO_HOSTS[@]}")
fi
showMessage "  - hosts: ${LXD_HOSTS[*]}"
