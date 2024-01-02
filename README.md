# LXD Tools

[Github Repository](https://github.com/spipu/lxd-tools)

**IMPORTANT**: All this is experimental !

## Requirements

It is compatible with :

* Ubuntu **18.04** with LXD **3**
* Ubuntu **20.04** with LXD **4**
* Ubuntu **22.04** with LXD **5**
 
It has not been tested on other versions.

The LXD package must have been installed :

With apt (for old versions of Ubuntu): 

```shell
sudo apt-get install lxd
```

Or with snap (for new versions of Ubuntu):

```shell
sudo snap install lxd
```

And configured :

```shell
sudo lxd init
```

**IMPORTANT**:

> During the init, use the default choice for each question, except for the type of the **storage-pools**.
> For **storage-pools**, answer **dir**.

```text
Would you like to use LXD clustering? (yes/no) [default=no]: 
Do you want to configure a new storage pool? (yes/no) [default=yes]: 
Name of the new storage pool [default=default]: 
Name of the storage backend to use (cephobject, dir, lvm, zfs, btrfs, ceph) [default=zfs]: dir
Would you like to connect to a MAAS server? (yes/no) [default=no]: 
Would you like to create a new local network bridge? (yes/no) [default=yes]: 
What should the new bridge be called? [default=lxdbr0]: 
What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
Would you like the LXD server to be available over the network? (yes/no) [default=no]: 
Would you like stale cached images to be updated automatically? (yes/no) [default=yes]: 
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]: 
```

## How To

Clone this repo, and launch the init script:

```bash
./install.sh
```

Then you can:

  * create a lxd container with `lxd-deploy [name] [template-name]`
  * remove a lxd container with `lxd-remove [name]`
  * list your lxd containers with `lxd-list`

## lxdfile

you can create a `lxdfile` to easily configure a lxd. Here is a example:

```
name=test
template=debian-10-buster
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

The available templates are listed below.

### Debian

* debian-10-buster
* debian-11-bullseye
* debian-12-bookworm

### Ubuntu

* ubuntu-18_04-bionic
* ubuntu-20_04-focal
* ubuntu-22_04-jammy

### Centos

* centos-8
* centos-9

## LXD native commands

Look at this [documentation](./LXD.md) for native LXD commands.

## Help & Support

For questions and bug reports, please use the GitHub issues page.

## License

This program is distributed under the MIT License. For more information see the [./LICENSE.md](./LICENSE.md) file.

Copyright 2022 Laurent Minguet
