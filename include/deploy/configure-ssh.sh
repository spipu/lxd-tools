#!/bin/bash

showMessage " > Configure SSH"

sudo lxc exec $LXD_NAME -- apt-get -qq -y install sudo ssh openssh-server > /dev/null
sudo lxc exec $LXD_NAME -- sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
sudo lxc exec $LXD_NAME -- sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config

sudo lxc exec $LXD_NAME -- mkdir -p /root/.ssh
sudo lxc file push $CURRENT_USER_SSH_KEY $LXD_NAME/root/.ssh/authorized_keys
sudo lxc exec $LXD_NAME -- chmod 700 /root/.ssh
sudo lxc exec $LXD_NAME -- chmod 600 /root/.ssh/authorized_keys
sudo lxc exec $LXD_NAME -- chown -R root.root /root/.ssh

sudo lxc exec $LXD_NAME -- systemctl restart ssh.service

HOME_DIR="/root"
sudo lxc exec $LXD_NAME -- sed -i "s/# eval/eval/g" $HOME_DIR/.bashrc
sudo lxc exec $LXD_NAME -- sed -i "s/# export/export/g" $HOME_DIR/.bashrc
sudo lxc exec $LXD_NAME -- sed -i "s/# alias/alias/g" $HOME_DIR/.bashrc
