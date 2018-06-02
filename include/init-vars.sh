#!/bin/bash

# Global Vars
LXD_NAME=""
LXD_HOST=""

# Get the current execution user
CURRENT_USER=`whoami`
if [ "${CURRENT_USER}" == "root" ]; then
    showError "You must not execute this script as root user."
fi

# Get the current execution folder
CURRENT_FOLDER=`pwd`
