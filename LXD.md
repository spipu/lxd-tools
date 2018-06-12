# LXD native commands

## Templates list

lxc image list images:

## Create

lxc launch images:debian/stretch test

## Actions

lxc list
lxc start test
lxc stop test
lxc delete test

## Logged in

lxc exec test -- /bin/bash
lxc exec test -- sudo --login --user delivery

## File Transfert

lxc file push truc.zip test/tmp/
lxc file pull test/etc/truc.zip .

## Mount

lxc config device add test testDevice disk source=/home/user/ path=/host/user 

## Export

lxc publish test --alias=test --force
lxc image export test

## Import

lxc image import 0bf450c17cb7034077c83487e0.tar.gz
lxc image list
