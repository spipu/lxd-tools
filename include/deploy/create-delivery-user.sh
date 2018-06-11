#!/bin/bash

showMessage " > Create delivery user"

APACHE_GROUP=""
if cut -d: -f1 $LXD_FOLDER/rootfs/etc/group | grep -q apache ; then
    APACHE_GROUP="apache"
elif cut -d: -f1 $LXD_FOLDER/rootfs/etc/group | grep -q www-data ; then
    APACHE_GROUP="www-data"
fi
APACHE_GROUP_MOD=${APACHE_GROUP:+"-g $APACHE_GROUP"}

sudo lxc exec $LXD_NAME -- useradd $APACHE_GROUP_MOD  -s /bin/bash -u "$CURRENT_USER_UID" -m $LXD_DELIVERY_USER

HOME_DIR="/home/$LXD_DELIVERY_USER"
sudo lxc exec $LXD_NAME -- sed -i "s/#force_color_prompt/force_color_prompt/g" $HOME_DIR/.bashrc
sudo lxc exec $LXD_NAME -- sed -i "s/#alias/alias/g" $HOME_DIR/.bashrc

showMessage " > configure ssh key for delivery user"

sudo lxc exec $LXD_NAME -- mkdir -p /home/$LXD_DELIVERY_USER/.ssh/
sudo lxc file push $CURRENT_USER_SSH_KEY $LXD_NAME/home/$LXD_DELIVERY_USER/.ssh/authorized_keys
sudo lxc exec $LXD_NAME -- chmod 700 /home/$LXD_DELIVERY_USER/.ssh
sudo lxc exec $LXD_NAME -- chmod 600 /home/$LXD_DELIVERY_USER/.ssh/authorized_keys
sudo lxc exec $LXD_NAME -- chown -R $LXD_DELIVERY_USER.$APACHE_GROUP /home/$LXD_DELIVERY_USER/.ssh

showMessage " > configure default folder for delivery user"

sudo lxc exec $LXD_NAME -- mkdir -p /var/www
sudo lxc exec $LXD_NAME -- chown -R $LXD_DELIVERY_USER.root /var/www
sudo lxc exec $LXD_NAME -- chmod -R 644 /var/www
sudo lxc exec $LXD_NAME -- chmod -R +X /var/www

showMessage " > configure sudo for delivery user"

sudo lxc exec $LXD_NAME -- mkdir -p /etc/sudoers.d/
sudo lxc file push $TEMPLATE_DIR/sudoers_delivery $LXD_NAME/etc/sudoers.d/$LXD_DELIVERY_USER
sudo lxc exec $LXD_NAME -- sed -i "s/{{ LXD_DELIVERY_USER }}/$LXD_DELIVERY_USER/g" /etc/sudoers.d/$LXD_DELIVERY_USER
sudo lxc exec $LXD_NAME -- sed -i "s/{{ LXD_APACHE_GROUP }}/$APACHE_GROUP/g" /etc/sudoers.d/$LXD_DELIVERY_USER
sudo lxc exec $LXD_NAME -- chmod 440 /etc/sudoers.d/$LXD_DELIVERY_USER
sudo lxc exec $LXD_NAME -- chown root.root /etc/sudoers.d/$LXD_DELIVERY_USER
