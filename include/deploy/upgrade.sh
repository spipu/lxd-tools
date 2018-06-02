#!/bin/bash

showMessage " > Upgrade default packages"
sudo lxc exec $LXD_NAME -- export DEBIAN_FRONTEND=noninteractive
sudo lxc exec $LXD_NAME -- apt-get -qq update          > /dev/null
sudo lxc exec $LXD_NAME -- apt-get -qq -y upgrade      > /dev/null
sudo lxc exec $LXD_NAME -- apt-get -qq -y dist-upgrade > /dev/null
sudo lxc exec $LXD_NAME -- apt-get -qq -y autoremove   > /dev/null
