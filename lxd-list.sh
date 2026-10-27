#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

LXD_MODE="list"

SCRIPT_DIR=`dirname "$(readlink -f $0)"`
source ${SCRIPT_DIR}/include/init.sh

showWarning "LXD - List - Begin"

sudo lxc list -c ns4tS

showWarning "LXD - List - End"
