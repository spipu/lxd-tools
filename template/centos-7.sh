#!/bin/bash

LXD_TEMPLATE_IMAGE="centos/7"
LXD_APACHE_GROUP="apache"

packageUpgrade()
{
    sudo lxc exec $LXD_NAME -- yum -y -q update      > /dev/null
    sudo lxc exec $LXD_NAME -- yum -y -q autoremove  > /dev/null
}

packageInstall()
{
    sudo lxc exec $LXD_NAME -- yum -y -q install $1
}

packageInstallSsh()
{
    packageInstall sudo
    packageInstall openssh-server
}

serviceRestart()
{
    sudo lxc exec $LXD_NAME -- systemctl restart $1
}

serviceRestartSsh()
{
    serviceRestart sshd
}

containerCleanup()
{
    sudo lxc exec $LXD_NAME -- yum clean all
}
