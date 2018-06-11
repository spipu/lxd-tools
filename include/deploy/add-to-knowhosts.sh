#!/bin/bash

showMessage " > Add to KnowHost"

if ! ssh-keygen -F $LXD_IP > /dev/null ; then
    ssh-keyscan $LXD_IP 2> /dev/null >>  $CURRENT_USER_HOME/.ssh/known_hosts
fi

for LXD_HOST in ${LXD_HOSTS[@]}; do
    showMessage "  - $LXD_HOST"
    if ! ssh-keygen -F $LXD_HOST > /dev/null ; then
        ssh-keyscan $LXD_HOST 2> /dev/null >>  $CURRENT_USER_HOME/.ssh/known_hosts
    fi
done

