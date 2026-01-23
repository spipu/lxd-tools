#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDERS=(
    # Debian
    "debian12"
    "debian13"
    # Ubuntu
    "ubuntu20"
    "ubuntu22"
    "ubuntu24"
    # Centos
    "centos9"
)

for FOLDER in "${FOLDERS[@]}"
do
    ./test-one.sh $FOLDER
done
