#!/bin/bash

LXD_TEMPLATE_DEPRECATED=1
LXD_TEMPLATE_IMAGE="centos/6"
LXD_APACHE_GROUP="apache"

packageUpgrade()
{
    sudo lxc exec $LXD_NAME -- yum update -y -q      > /dev/null  2>&1
}

packageInstall()
{
    sudo lxc exec $LXD_NAME -- yum install -y -q  $1 > /dev/null  2>&1
}

packageInstallSsh()
{
    packageInstall sudo
    packageInstall openssh-server
}

serviceRestart()
{
    sudo lxc exec $LXD_NAME -- service $1 restart > /dev/null
}

serviceRestartSsh()
{
    serviceRestart sshd
}

containerCleanup()
{
    sudo lxc exec $LXD_NAME -- yum clean all -q > /dev/null  2>&1
    sudo lxc exec $LXD_NAME -- ln -s /etc/centos-release /etc/os-release
}
