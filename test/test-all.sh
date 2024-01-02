#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDERS=(
    # Debian
    "debian10"
    "debian11"
    "debian12"
    # Ubuntu
    "ubuntu18"
    "ubuntu20"
    "ubuntu22"
    # Centos
    "centos8"
    "centos9"
)

for FOLDER in "${FOLDERS[@]}"
do
    ./test-one.sh $FOLDER
done
