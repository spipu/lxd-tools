#!/bin/bash

showMessage " > Waiting for IP"

LXD_IP=""
for i in $(seq 1 60); do
    LXD_IP=$(sudo lxc list "^$LXD_NAME\$" --format csv -c 4 | cut -d' ' -f1)
    if [[ "$LXD_IP" ]]; then
        break
    fi
    sleep 1
done
if [[ ! "$LXD_IP" ]]; then
    showError "Failed to find the ip"
fi
showMessage "  - $LXD_IP"
