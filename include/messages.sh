#!/bin/bash

# Some colors
RESET="$(tput sgr0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"

# Function - Show a message
showMessage() {
    MESSAGE=$1;
    echo "$GREEN`date +%d/%m/%Y-%H:%M:%S`$RESET $BLUE$MESSAGE$RESET"
}

# Function - Show a warning
showWarning() {
    MESSAGE=$1;
    echo "$GREEN`date +%d/%m/%Y-%H:%M:%S`$RESET $YELLOW$MESSAGE$RESET"
}

# Function - Show an error
showError() {
    MESSAGE=$1;
    echo "$GREEN`date +%d/%m/%Y-%H:%M:%S`$RESET $RED$MESSAGE$RESET"
    exit 1
}

# Function : Show a resume
showResume() {
    HOSTS="${LXD_HOSTS[@]}"
    MOUNTS="${LXD_MOUNTS[@]}"

    showMessage "  - name:          $LXD_NAME"
    showMessage "  - hosts:         $HOSTS"
    showMessage "  - delivery user: $LXD_DELIVERY_USER"
    showMessage "  - mounts:        $MOUNTS"
}