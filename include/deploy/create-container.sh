#!/bin/bash

showMessage " > Create Container"
sudo lxc launch images:debian/stretch $LXD_NAME > /dev/null
sleep 4
