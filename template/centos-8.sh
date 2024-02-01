#!/bin/bash

LXD_TEMPLATE_DEPRECATED=0
LXD_TEMPLATE_IMAGE="images:centos/8-Stream"
LXD_APACHE_GROUP="apache"

packageUpgrade()
{
    sudo lxc exec $LXD_NAME -- yum update -y -q      > /dev/null  2>&1
    sudo lxc exec $LXD_NAME -- yum autoremove -y -q   > /dev/null 2>&1
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
    sudo lxc exec $LXD_NAME -- systemctl restart $1 > /dev/null
}

serviceRestartSsh()
{
    serviceRestart sshd
}

containerCleanup()
{
    sudo lxc exec $LXD_NAME -- yum clean all -q > /dev/null  2>&1
}
