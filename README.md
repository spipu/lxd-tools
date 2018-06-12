# LXD Tools by Lamin

## How To

in first, launch the init script:

```bash
sudo ./install.sh
```

then you can:

  * create a lxd with `lxd-deploy [name] [template-name]`
  * remove a lxd with `lxd-remove [name]`

## lxdfile

you can create a `lxdfile` to easily configure a lxc. Here is a example:

```
name=test
template=debian-stretch
host=test.lxd
host=test.local
delivery-user=delivery
mount=.:/var/www/toto
mount=/other/folder:/var/www/titi
```

then you can:

  * create your lxd with `lxd-deploy`
  * remove your lxd with `lxd-remove`
  
## LXD native commands

### Templates list

lxc image list images:

#### Create

lxc launch images:debian/stretch test

### Actions

lxc list
lxc start test
lxc stop test
lxc delete test

### Logged in

lxc exec test -- /bin/bash
lxc exec test -- sudo --login --user delivery

### File Transfert

lxc file push truc.zip test/tmp/
lxc file pull test/etc/truc.zip .

### Mount

lxc config device add test testDevice disk source=/home/user/ path=/host/user 

### Export

lxc publish test --alias=test --force
lxc image export test

### Import

lxc image import 0bf450c17cb7034077c83487e0.tar.gz
lxc image list
