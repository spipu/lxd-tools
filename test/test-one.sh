#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDER="$1"

echo "===[$FOLDER]================================================"

echo "===[$FOLDER][Create]========================================"
cd $FOLDER
lxd-deploy

echo "===[$FOLDER][Test]=========================================="
HOST="${FOLDER}.lxc"
ssh root@$HOST     "cat /etc/os-release"
ssh root@$HOST     "whoami && pwd"
ssh delivery@$HOST "whoami && pwd"

echo "===[$FOLDER][Remove]========================================"
lxd-remove
cd ..

echo "===[$FOLDER][Finished]======================================"
echo ""
