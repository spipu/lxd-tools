#!/bin/bash

LXD_TEMPLATE_IMAGE="ubuntu/trusty"
LXD_APACHE_GROUP="www-data"

packageUpgrade()
{
    sudo lxc exec $LXD_NAME -- apt-get -qq update > /dev/null
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y dist-upgrade"      > /dev/null
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y autoremove"        > /dev/null
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y install apt-utils" > /dev/null 2>&1
}

packageInstall()
{
    sudo lxc exec $LXD_NAME -- sh -c "export DEBIAN_FRONTEND=noninteractive && apt-get -qq -y install $1" > /dev/null
}

serviceRestart()
{
    sudo lxc exec $LXD_NAME -- service $1 restart > /dev/null
}

containerCleanup()
{
    sudo lxc exec $LXD_NAME -- apt-get -qq clean > /dev/null
    sudo lxc exec $LXD_NAME -- userdel ubuntu
    sudo lxc exec $LXD_NAME -- rm -rf /home/ubuntu
}