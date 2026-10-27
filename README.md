# LXD Tools

[Github Repository](https://github.com/spipu/lxd-tools)

**IMPORTANT**: All this is experimental !

## Requirements

It is compatible with :

* Ubuntu **20.04** with LXD **4**
* Ubuntu **22.04** with LXD **5**
* Ubuntu **24.04** with LXD **6**
 
It has not been tested on other versions.

The LXD package must have been installed with snap:

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

## Remote

The templates use the following remotes:

* `ubuntu-minimal`: https://cloud-images.ubuntu.com/minimal/releases/ (Ubuntu templates)
* `images`: https://images.lxd.canonical.com (Debian and Centos templates)

They are configured by default with the snap version of LXD.

You can see the remotes with:

```bash
lxc remote list
```

## How To

Clone this repo, and launch the init script:

```bash
./install.sh
```

Then you can:

  * create a lxd container with `lxd-deploy [name] [template-name]`
  * remove a lxd container with `lxd-remove [name]`
  * start a lxd container with `lxd-start [name]` (updates the ip in `/etc/hosts` and `/root/lxd-info`)
  * stop a lxd container with `lxd-stop [name]` (cleans `/etc/hosts`)
  * show the info of a lxd container with `lxd-info [name]` (works even if the container is stopped)
  * list your lxd containers with `lxd-list`

## lxdfile

you can create a `lxdfile` to easily configure a lxd. Here is a example:

```
name=test
template=debian-13-trixie
host=test.lxd
host=test.local
delivery-user=delivery
mount=.:/var/www/toto
mount=/other/folder:/var/www/titi
```

then you can:

  * create your lxd with `lxd-deploy`
  * start your lxd with `lxd-start`
  * stop your lxd with `lxd-stop`
  * show the info of your lxd with `lxd-info`
  * remove your lxd with `lxd-remove`

## lxd-info

When a container is deployed, a file `/root/lxd-info` is created inside it:

```
LXD info
name=test
template=debian-13-trixie
image=images:debian/trixie
ip=10.x.x.x
host=test.lxd
host=test.local
```

It is used by `lxd-start`, `lxd-stop`, `lxd-info` and `lxd-remove`, even if the container is stopped.
The `ip` line is updated by `lxd-start`.

## Templates

The available templates are listed below.

### Debian

* debian-12-bookworm
* debian-13-trixie

### Ubuntu

* ubuntu-20_04-focal
* ubuntu-22_04-jammy
* ubuntu-24_04-noble

### Centos

* centos-9

## LXD native commands

Look at this [documentation](./LXD.md) for native LXD commands.

## Help & Support

For questions and bug reports, please use the GitHub issues page.

## License

This program is distributed under the MIT License. For more information see the [./LICENSE.md](./LICENSE.md) file.

Copyright 2026 Laurent Minguet
