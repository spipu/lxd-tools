# LXD Tools by Lamin

## How To

in first, clone this repo, and launch the init script:

```bash
./install.sh
```

then you can:

  * create a lxd container with `lxd-deploy [name] [template-name]`
  * remove a lxd container with `lxd-remove [name]`
  * list your lxd containers with `lxd-list`

## lxdfile

you can create a `lxdfile` to easily configure a lxd. Here is a example:

```
name=test
template=debian-9-stretch
host=test.lxd
host=test.local
delivery-user=delivery
mount=.:/var/www/toto
mount=/other/folder:/var/www/titi
```

then you can:

  * create your lxd with `lxd-deploy`
  * remove your lxd with `lxd-remove`

## Templates

The available templates are listed bellow.

### Debian

* debian-9-stretch
* debian-8-jessie
* debian-7-wheezy

### Ubuntu

* ubuntu-16_04-xenial
* ubuntu-18_04-bionic

### Centos

@todo

## LXD native commands

Look at this [documentation](./LXD.md) for native LXD commands.
