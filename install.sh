#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

source ./include/messages.sh
source ./include/init-vars.sh

showMessage "Install LXD tools"

showWarning "Started"

showMessage " > Create Symlinks"

sudo chmod +x $CURRENT_FOLDER/lxd-deploy.sh
sudo chmod +x $CURRENT_FOLDER/lxd-list.sh
sudo chmod +x $CURRENT_FOLDER/lxd-remove.sh

sudo ln -fs $CURRENT_FOLDER/lxd-deploy.sh /usr/local/bin/lxd-deploy
sudo ln -fs $CURRENT_FOLDER/lxd-list.sh   /usr/local/bin/lxd-list
sudo ln -fs $CURRENT_FOLDER/lxd-remove.sh /usr/local/bin/lxd-remove

showMessage " > Configure package"

NEED_INSTALL=$(sudo dpkg -l lxd 2>/dev/null | grep lxd | wc -l  )
if [ $NEED_INSTALL -eq 0 ]; then
    showError "   > LXD Package Not Installed - please look at the README.md file"
else
    showWarning "   > LXD Package Installed"
fi

UID_LINE="lxd:$CURRENT_USER_UID:1"
grep -q -F "$UID_LINE" /etc/subuid || echo "$UID_LINE" | sudo tee -a /etc/subuid > /dev/null
grep -q -F "$UID_LINE" /etc/subgid || echo "$UID_LINE" | sudo tee -a /etc/subgid > /dev/null

UID_LINE="root:$CURRENT_USER_UID:1"
grep -q -F "$UID_LINE" /etc/subuid || echo "$UID_LINE" | sudo tee -a /etc/subuid > /dev/null
grep -q -F "$UID_LINE" /etc/subgid || echo "$UID_LINE" | sudo tee -a /etc/subgid > /dev/null

showMessage " > Restart Service"

sudo systemctl restart lxd 2>&1 > /dev/null

showWarning "Finished"
