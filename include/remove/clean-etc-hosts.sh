#!/bin/bash

showMessage " > Clean /etc/hosts file"

sudo sed -i "/$LXD_IP/d" /etc/hosts

for LXD_HOST in ${LXD_HOSTS[@]}; do
    showMessage "  - $LXD_HOST"
    sudo sed -i "/$LXD_HOST/d" /etc/hosts
done
