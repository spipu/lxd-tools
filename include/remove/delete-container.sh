#!/bin/bash

showMessage " > Stop Container"
sudo lxc stop $LXD_NAME --force > /dev/null
sleep 1

showMessage " > Delete Container"
sudo lxc delete $LXD_NAME > /dev/null
