#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

FOLDER="$1"

echo "Test [$FOLDER]"
cd $FOLDER
lxd-deploy

#HOST="${FOLDER}.lxc"
#ssh root@$HOST     /home/delivery/test/test-root.sh
#ssh delivery@$HOST /home/delivery/test/test-delivery.sh
#if [ ! -f ./test.md ]; then
#    echo "Test file not found"
#    exit 1
#fi
#rm -f ./test.md
#curl http://${HOST}/ > /dev/null

lxd-remove
cd ..
