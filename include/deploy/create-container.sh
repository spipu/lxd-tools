#!/bin/bash

showMessage " > Create Container from [$LXD_TEMPLATE_IMAGE]"
sudo lxc init $LXD_TEMPLATE_IMAGE $LXD_NAME

showMessage " > Configure Container"

sudo lxc config set $LXD_NAME raw.idmap "both $CURRENT_USER_UID $CURRENT_USER_UID"

showMessage " > Start Container"
sudo lxc start $LXD_NAME &
sleep 1

showMessage " > Waiting for IP"

while [ ! "$LXD_IP" ] ; do
    LXD_IP=`sudo lxc list "^$LXD_NAME\$" --format csv -c 4 | cut -d' ' -f1`
done

showMessage "  - $LXD_IP"

showMessage " > Add info"

sudo lxc exec $LXD_NAME -- sh -c "echo \"LXD info\"                     >  /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"name=$LXD_NAME\"               >> /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"template=$LXD_TEMPLATE_NAME\"  >> /root/lxd-info" > /dev/null
sudo lxc exec $LXD_NAME -- sh -c "echo \"image=$LXD_TEMPLATE_IMAGE\"    >> /root/lxd-info" > /dev/null
