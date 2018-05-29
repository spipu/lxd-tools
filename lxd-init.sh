#!/bin/bash

apt-get -y -qq install lxd > /dev/null

#lxd init 

ln -fs /home/lamin/Logiciels/LXD/lxd-abstract.sh /usr/local/bin/lxd-abstract
ln -fs /home/lamin/Logiciels/LXD/lxd-deploy.sh   /usr/local/bin/lxd-deploy
ln -fs /home/lamin/Logiciels/LXD/lxd-remove.sh   /usr/local/bin/lxd-remove

chmod +x /home/lamin/Logiciels/LXD/lxd-*.sh


