#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

CURRENT_FOLDER=`pwd`

apt-get -y -qq install lxd > /dev/null

lxd init 

chmod -x ${CURRENT_FOLDER}/lxd-abstract.sh
chmod +x ${CURRENT_FOLDER}/lxd-deploy.sh
chmod +x ${CURRENT_FOLDER}/lxd-remove.sh

ln -fs ${CURRENT_FOLDER}/lxd-abstract.sh /usr/local/bin/lxd-abstract
ln -fs ${CURRENT_FOLDER}/lxd-deploy.sh   /usr/local/bin/lxd-deploy
ln -fs ${CURRENT_FOLDER}/lxd-remove.sh   /usr/local/bin/lxd-remove

