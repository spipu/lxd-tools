#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

source ./include/common/messages.sh
source ./include/common/init-vars.sh

showMessage "Install LXD tools"

showWarning "Script - Install - Begin"

showMessage " > Create Symlinks"

sudo chmod +x $CURRENT_FOLDER/lxd-deploy.sh
sudo chmod +x $CURRENT_FOLDER/lxd-info.sh
sudo chmod +x $CURRENT_FOLDER/lxd-list.sh
sudo chmod +x $CURRENT_FOLDER/lxd-remove.sh
sudo chmod +x $CURRENT_FOLDER/lxd-start.sh
sudo chmod +x $CURRENT_FOLDER/lxd-stop.sh

sudo ln -fs $CURRENT_FOLDER/lxd-deploy.sh /usr/local/bin/lxd-deploy
sudo ln -fs $CURRENT_FOLDER/lxd-info.sh   /usr/local/bin/lxd-info
sudo ln -fs $CURRENT_FOLDER/lxd-list.sh   /usr/local/bin/lxd-list
sudo ln -fs $CURRENT_FOLDER/lxd-remove.sh /usr/local/bin/lxd-remove
sudo ln -fs $CURRENT_FOLDER/lxd-start.sh  /usr/local/bin/lxd-start
sudo ln -fs $CURRENT_FOLDER/lxd-stop.sh   /usr/local/bin/lxd-stop

showMessage " > Search package"

LXD_VERSION=$(lxd --version)
LXD_MAIN_VERSION=$(echo "${LXD_VERSION}" | cut -d "." -f 1)
if [[ -z "${LXD_VERSION}" ]]; then
    showError "   > LXD Package Not Installed - please look at the README.md file"
else
    showWarning "   > LXD ${LXD_MAIN_VERSION} Package Installed"
fi

showMessage " > Configure uid"

UID_LINE="lxd:$CURRENT_USER_UID:1"
grep -q -F "$UID_LINE" /etc/subuid || echo "$UID_LINE" | sudo tee -a /etc/subuid > /dev/null
grep -q -F "$UID_LINE" /etc/subgid || echo "$UID_LINE" | sudo tee -a /etc/subgid > /dev/null

UID_LINE="root:$CURRENT_USER_UID:1"
grep -q -F "$UID_LINE" /etc/subuid || echo "$UID_LINE" | sudo tee -a /etc/subuid > /dev/null
grep -q -F "$UID_LINE" /etc/subgid || echo "$UID_LINE" | sudo tee -a /etc/subgid > /dev/null

showMessage " > Restart Service"

sudo systemctl restart snap.lxd.daemon

showWarning "Script - Install - End"
