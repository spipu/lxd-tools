#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDERS=(
    # Debian
    "debian7"
    "debian8"
    "debian9"
    "debian10"
    # Ubuntu
    "ubuntu14"
    "ubuntu16"
    "ubuntu18"
    # Centos
    "centos6"
    "centos7"
)

for FOLDER in "${FOLDERS[@]}"
do
    ./test-one.sh $FOLDER
done
