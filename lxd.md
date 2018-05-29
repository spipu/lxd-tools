# Network

If your host is desktop Ubuntu, then it uses NetworkManager, which means you add a file like

$ cat /etc/NetworkManager/dnsmasq.d/lxd
server=/lxd/10.0.185.1
server=/1.185.0.10.in-addr.arpa/10.0.185.1

The IP 10.0.185.1 is the IP address that the LXD dnsmasq is listening on.

# Liste Templates

lxc image list images:

# Creation

lxc launch images:debian/stretch test

# Actions

lxc list
lxc start test
lxc stop test
lxc delete test

# Export

lxc publish test --alias=test --force
lxc image export test

# Import

lxc image import 0bf450c17cb7034077c83487e0.tar.gz
lxc image list

# Se connecter

lxc exec test -- /bin/bash
lxc exec test -- sudo --login --user delivery

# Transfert

lxc file push truc.zip test/tmp/
lxc file pull test/etc/truc.zip .

# Mount

lxc config device add test testDevice disk source=/home/lamin/ path=/host/lamin 

