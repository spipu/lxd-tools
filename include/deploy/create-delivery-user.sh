#!/bin/bash

showMessage " > Create delivery user"

sudo lxc exec $LXD_NAME -- useradd -g $LXD_APACHE_GROUP -s /bin/bash -u "$CURRENT_USER_UID" -m $LXD_DELIVERY_USER

LXD_DELIVERY_HOME="/home/$LXD_DELIVERY_USER"
sudo lxc exec $LXD_NAME -- sed -i "s/#force_color_prompt/force_color_prompt/g" $LXD_DELIVERY_HOME/.bashrc
sudo lxc exec $LXD_NAME -- sed -i "s/#alias/alias/g" $LXD_DELIVERY_HOME/.bashrc

showMessage " > configure ssh key for delivery user"

sudo lxc exec $LXD_NAME -- mkdir -p $LXD_DELIVERY_HOME/.ssh/
sudo lxc file push $CURRENT_USER_SSH_KEY $LXD_NAME$LXD_DELIVERY_HOME/.ssh/authorized_keys
sudo lxc exec $LXD_NAME -- chmod 700 $LXD_DELIVERY_HOME/.ssh
sudo lxc exec $LXD_NAME -- chmod 600 $LXD_DELIVERY_HOME/.ssh/authorized_keys
sudo lxc exec $LXD_NAME -- chown -R $LXD_DELIVERY_USER.$LXD_APACHE_GROUP $LXD_DELIVERY_HOME/.ssh

showMessage " > configure default folder for delivery user"

sudo lxc exec $LXD_NAME -- mkdir -p /var/www
sudo lxc exec $LXD_NAME -- chown -R $LXD_DELIVERY_USER.root /var/www
sudo lxc exec $LXD_NAME -- chmod -R 644 /var/www
sudo lxc exec $LXD_NAME -- chmod -R +X /var/www

showMessage " > configure sudo for delivery user"

sudo lxc exec $LXD_NAME -- mkdir -p /etc/sudoers.d/
sudo lxc exec $LXD_NAME -- sh -c "echo 'Runas_Alias SERVERACCOUNTS=$LXD_APACHE_GROUP'          >  /etc/sudoers.d/$LXD_DELIVERY_USER"
sudo lxc exec $LXD_NAME -- sh -c "echo '$LXD_DELIVERY_USER ALL=(SERVERACCOUNTS) NOPASSWD: ALL' >> /etc/sudoers.d/$LXD_DELIVERY_USER"
sudo lxc exec $LXD_NAME -- chmod 440 /etc/sudoers.d/$LXD_DELIVERY_USER
sudo lxc exec $LXD_NAME -- chown root.root /etc/sudoers.d/$LXD_DELIVERY_USER
