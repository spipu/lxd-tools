#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDERS=(
    "debian-7-wheezy"
    "debian-8-jessie"
    "debian-9-stretch"
    "ubuntu-16_04-xenial"
    "ubuntu-18_04-bionic"
)

for FOLDER in "${FOLDERS[@]}"
do
    echo "Test [$FOLDER]"
    cd $FOLDER
    lxd-deploy
    lxd-remove
    cd ..
done