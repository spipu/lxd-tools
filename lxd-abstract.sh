#!/bin/bash

# Some colors
RESET="$(tput sgr0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"

# Functioin - Show a message
showMessage() {
    MESSAGE=$1;
    echo "${GREEN}`date +%d/%m/%Y-%H:%M:%S`${RESET} ${BLUE}${MESSAGE}${RESET}"
}

# Function - Show a warning
showWarning() {
    MESSAGE=$1;
    echo "${GREEN}`date +%d/%m/%Y-%H:%M:%S`${RESET} ${YELLOW}${MESSAGE}${RESET}"
}


# Function - Show an error
showError() {
    MESSAGE=$1;
    echo "${GREEN}`date +%d/%m/%Y-%H:%M:%S`${RESET} ${RED}${MESSAGE}${RESET}"
    exit 1
}

if [ -z $1 ] ; then
    showError "ERROR: You must provide a LXD name"
fi
LXD_NAME="$1"
LXD_NAME=$(echo ${LXD_NAME} | tr 'A-Z' 'a-z')
LXD_NAME_PROTECT=$(echo ${LXD_NAME} | tr -d 'a-z0-9-')
if [ "${LXD_NAME_PROTECT}" != "" ]; then
    showError "Your LXD name is not valid. Use only alphanum, minus chars."
fi

LXD_FOLDER="/var/lib/lxd/storage-pools/default/containers/${LXD_NAME}"
LXD_HOST="${LXD_NAME}.lxd"

