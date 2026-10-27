#!/bin/bash

showMessage " > Clean knowhosts file"

if [[ "$LXD_IP" ]]; then
    ssh-keygen -R "$LXD_IP" > /dev/null
fi
if [[ "$LXD_INFO_IP" ]] && [[ "$LXD_INFO_IP" != "$LXD_IP" ]]; then
    ssh-keygen -R "$LXD_INFO_IP" > /dev/null
fi

for LXD_HOST in ${LXD_HOSTS[@]}; do
    showMessage "  - $LXD_HOST"
    ssh-keygen -R "$LXD_HOST" > /dev/null
done
