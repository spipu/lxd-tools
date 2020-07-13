#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDERS=(
    # Debian
    "debian8"
    "debian9"
    "debian10"
    "debian11"
    # Ubuntu
    "ubuntu14"
    "ubuntu16"
    "ubuntu18"
    "ubuntu20"
    # Centos
    "centos6"
    "centos7"
    "centos8"
)

for FOLDER in "${FOLDERS[@]}"
do
    ./test-one.sh $FOLDER
done
