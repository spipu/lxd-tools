#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

source ./include/messages.sh

# Get the current execution user
CURRENT_USER=`whoami`
if [ "$CURRENT_USER" != "root" ]; then
    showError "You must execute this script as root user."
fi

CURRENT_FOLDER=`pwd`

 apt-get -y -qq install lxd > /dev/null
 lxd init

chmod +x $CURRENT_FOLDER/lxd-deploy.sh
chmod +x $CURRENT_FOLDER/lxd-remove.sh

ln -fs $CURRENT_FOLDER/lxd-deploy.sh   /usr/local/bin/lxd-deploy
ln -fs $CURRENT_FOLDER/lxd-remove.sh   /usr/local/bin/lxd-remove

