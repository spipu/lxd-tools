#!/bin/bash

showMessage " > Test Ping"
ping -c 3 $LXD_HOST > /dev/null

showMessage " > Test SSH"
ssh root@$LXD_HOST "ls -lah" > /dev/null

showMessage " > Container List"
sudo lxc list
