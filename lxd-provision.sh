#!/bin/bash

showMessage "Install basic packages"
sudo lxc exec $LXD_NAME -- apt-get -qq -y install inetutils-ping curl vim aptitude ca-certificates bash-completion file iproute less lsof moreutils patch rsync net-tools screen ssl-cert strace tcpdump telnet unzip ntp acpid iotop dstat apt-transport-https tar wget > /dev/null

