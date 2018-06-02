#!/bin/bash

showMessage " > Stop Container"
sudo lxc exec $LXD_NAME -- shutdown -h now
sleep 1

showMessage " > Delete Container"
sudo lxc delete $LXD_NAME
