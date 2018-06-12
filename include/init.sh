#!/bin/bash

INCLUDE_DIR="$SCRIPT_DIR/include"
TEMPLATE_DIR="$SCRIPT_DIR/template"

# Generic Includes
source $INCLUDE_DIR/messages.sh
source $INCLUDE_DIR/init-vars.sh

if [ "$LXD_MODE" == "deploy" ] || [ "$LXD_MODE" == "remove" ]; then
    source $INCLUDE_DIR/read-lxd.sh
fi