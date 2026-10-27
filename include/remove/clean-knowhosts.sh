#!/bin/bash

source $INCLUDE_DIR/common/clean-knowhosts-ip.sh

showMessage " > Clean hosts in knowhosts file"

for LXD_HOST in ${LXD_HOSTS[@]}; do
    showMessage "  - $LXD_HOST"
    ssh-keygen -R "$LXD_HOST" > /dev/null 2>&1
done
