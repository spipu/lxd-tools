#!/bin/bash

showMessage " > Add to KnowHost"

if ! ssh-keygen -F "$LXD_IP" > /dev/null ; then
    ssh-keyscan "$LXD_IP" 2> >(grep -v '^#' >&2) >> "$CURRENT_USER_HOME/.ssh/known_hosts"
fi

LXD_HOST_MAIN="${LXD_HOSTS[0]}"

showMessage "  - $LXD_HOST_MAIN"
if ! ssh-keygen -F "$LXD_HOST_MAIN" > /dev/null ; then
    ssh-keyscan "$LXD_HOST_MAIN" 2> >(grep -v '^#' >&2) >> "$CURRENT_USER_HOME/.ssh/known_hosts"
fi
