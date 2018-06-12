#!/bin/bash

showMessage " > Test Ping"
ping -c 3 ${LXD_HOSTS[0]} > /dev/null

showMessage " > Test SSH"
ssh root@${LXD_HOSTS[0]} "ls -lah" > /dev/null

showMessage " > Container List"
sudo lxc list -c ns4tS
