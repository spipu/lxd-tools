# LXD Tools

[Github Repository](https://github.com/spipu/lxd-tools)

**IMPORTANT**: All this is experimental !

## Requirements

It is compatible with Ubuntu **18.04** and **20.04**, and with LXD **3** and **4**.
 
It has not been tested on other versions.

The LXD package must have been installed :

```shell
sudo apt-get install lxd
```

And configured :

```shell
sudo lxd init
```

**IMPORTANT**:

> During the init, use the default choice for each question, except for the type of the **storage-pools**.
> For **storage-pools**, answer **dir**.


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

The available templates are listed below.

### Debian

* debian-8-jessie
* debian-9-stretch
* debian-10-buster
* debian-11-bullseye

### Ubuntu

* ubuntu-14_04-trusty
* ubuntu-16_04-xenial
* ubuntu-18_04-bionic
* ubuntu-20_04-focal

### Centos

* centos-6
* centos-7
* centos-8

## LXD native commands

Look at this [documentation](./LXD.md) for native LXD commands.

## Help & Support

For questions and bug reports, please use the GitHub issues page.

## License

This program is distributed under the MIT License. For more information see the [./LICENSE.md](./LICENSE.md) file.

Copyright 2020 Laurent Minguet
