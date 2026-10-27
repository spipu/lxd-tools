#!/bin/bash

showMessage " > Clean ip in knowhosts file"

if [[ "$LXD_IP" ]]; then
    showMessage "  - $LXD_IP"
    ssh-keygen -R "$LXD_IP" > /dev/null
fi
if [[ "$LXD_INFO_IP" ]] && [[ "$LXD_INFO_IP" != "$LXD_IP" ]]; then
    showMessage "  - $LXD_INFO_IP"
    ssh-keygen -R "$LXD_INFO_IP" > /dev/null
fi
