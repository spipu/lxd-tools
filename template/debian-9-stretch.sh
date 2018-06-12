#!/bin/bash

LXD_TEMPLATE_IMAGE="debian/stretch"
LXD_APACHE_GROUP="www-data"

packageUpdate() {
    sudo lxc exec $LXD_NAME -- apt-get -qq update > /dev/null
}

packageUpgrade() {
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y dist-upgrade" > /dev/null
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y autoremove"   > /dev/null
}

packageInstall() {
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y install $1" > /dev/null
}

serviceRestart() {
    sudo lxc exec $LXD_NAME -- systemctl restart $1.service
}
