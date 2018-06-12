#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

source ./include/messages.sh
source ./include/init-vars.sh

showMessage "Install LXD tools"

showWarning "Started"

showMessage " > Install package"

sudo apt-get -qq -y install lxd  > /dev/null

showMessage " > Configure LXD"

sudo lxd init --auto

UID_LINE="lxd:$CURRENT_USER_UID:1"
grep -q -F "$UID_LINE" /etc/subuid || echo "$UID_LINE" | sudo tee -a /etc/subuid > /dev/null
grep -q -F "$UID_LINE" /etc/subgid || echo "$UID_LINE" | sudo tee -a /etc/subgid > /dev/null

UID_LINE="root:$CURRENT_USER_UID:1"
grep -q -F "$UID_LINE" /etc/subuid || echo "$UID_LINE" | sudo tee -a /etc/subuid > /dev/null
grep -q -F "$UID_LINE" /etc/subgid || echo "$UID_LINE" | sudo tee -a /etc/subgid > /dev/null

showMessage " > Create Symlinks"

sudo chmod +x $CURRENT_FOLDER/lxd-deploy.sh
sudo chmod +x $CURRENT_FOLDER/lxd-remove.sh
sudo ln -fs $CURRENT_FOLDER/lxd-deploy.sh   /usr/local/bin/lxd-deploy
sudo ln -fs $CURRENT_FOLDER/lxd-remove.sh   /usr/local/bin/lxd-remove

showMessage " > Start Service"

sudo systemctl restart lxd

showWarning "Finished"
