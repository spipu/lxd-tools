#!/bin/bash

showMessage " > Clean knowhosts file"

ssh-keygen -R "$LXD_IP"   > /dev/null

for LXD_HOST in ${LXD_HOSTS[@]}; do
    showMessage "  - $LXD_HOST"
    ssh-keygen -R "$LXD_HOST" > /dev/null
done
