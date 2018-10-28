#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDERS=(
    # Debian
    "debian-7-wheezy"
    "debian-8-jessie"
    "debian-9-stretch"
    "debian-10-buster"
    # Ubuntu
    "ubuntu-14_04-trusty"
    "ubuntu-16_04-xenial"
    "ubuntu-18_04-bionic"
    # Centos
    "centos-7"
)

for FOLDER in "${FOLDERS[@]}"
do
    echo "Test [$FOLDER]"
    cd $FOLDER
    lxd-deploy
    lxd-remove
    cd ..
done