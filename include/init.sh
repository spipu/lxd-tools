#!/bin/bash

INCLUDE_DIR="$SCRIPT_DIR/include"
TEMPLATE_DIR="$SCRIPT_DIR/template"

# Generic Includes
source $INCLUDE_DIR/common/messages.sh
source $INCLUDE_DIR/common/init-vars.sh

if [ "$LXD_MODE" == "deploy" ] || [ "$LXD_MODE" == "remove" ] || [ "$LXD_MODE" == "start" ] || [ "$LXD_MODE" == "stop" ] || [ "$LXD_MODE" == "info" ]; then
    source $INCLUDE_DIR/common/read-lxd.sh
fi