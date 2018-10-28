#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDER="$1"

echo "Test [$FOLDER]"
cd $FOLDER
lxd-deploy

HOST="${FOLDER}.lxc"
ssh root@$HOST     ls -l
ssh delivery@$HOST ls -l

lxd-remove
cd ..
