#!/bin/bash

LXD_TEMPLATE_IMAGE="debian/jessie"
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

packageInstallSsh()
{
    packageInstall sudo
    packageInstall ssh
    packageInstall openssh-server
}

serviceRestart()
{
    sudo lxc exec $LXD_NAME -- systemctl restart $1.service > /dev/null
}

serviceRestartSsh()
{
    serviceRestart ssh
}

containerCleanup()
{
    sudo lxc exec $LXD_NAME -- apt-get -qq clean > /dev/null
}
