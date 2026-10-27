#!/bin/bash

showMessage " > Add ip to knowhosts file"
showMessage "  - $LXD_IP"

if ! ssh-keygen -F "$LXD_IP" > /dev/null ; then
    LXD_IP_KEYS=""
    for i in $(seq 1 10); do
        LXD_IP_KEYS=$(ssh-keyscan "$LXD_IP" 2> /dev/null || true)
        if [[ "$LXD_IP_KEYS" ]]; then
            break
        fi
        sleep 1
    done
    if [[ ! "$LXD_IP_KEYS" ]]; then
        showWarning "  - ssh not reachable, ip not added"
    else
        echo "$LXD_IP_KEYS" >> "$CURRENT_USER_HOME/.ssh/known_hosts"
    fi
fi
