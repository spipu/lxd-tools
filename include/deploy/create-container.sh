#!/bin/bash

showMessage " > Create Container from [$LXD_TEMPLATE_IMAGE]"
sudo lxc init $LXD_TEMPLATE_IMAGE $LXD_NAME

showMessage " > Configure Container"

sudo lxc config set $LXD_NAME raw.idmap "both $CURRENT_USER_UID $CURRENT_USER_UID"

showMessage " > Start Container"
sudo lxc start $LXD_NAME

source $INCLUDE_DIR/common/wait-ip.sh

showMessage " > Add info"

sudo lxc exec $LXD_NAME -- sh -c "echo \"LXD info\"                     >  /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"name=$LXD_NAME\"               >> /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"template=$LXD_TEMPLATE_NAME\"  >> /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"image=$LXD_TEMPLATE_IMAGE\"    >> /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"ip=$LXD_IP\"                   >> /root/lxd-info" > /dev/null
for LXD_HOST in ${LXD_HOSTS[@]}; do
    sudo lxc exec $LXD_NAME -- sh -c "echo \"host=$LXD_HOST\"             >> /root/lxd-info" > /dev/null
done
