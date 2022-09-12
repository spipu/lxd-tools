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

if [[ "${LXD_MAIN_VERSION}" == "3" ]]; then
    sudo systemctl restart lxd
else
    sudo systemctl restart snap.lxd.daemon
fi

showWarning "Finished"
