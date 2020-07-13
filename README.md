# LXD Tools

**IMPORTANT**: All this is experimental !

## Requirements

You have an **Ubuntu 18.04** or **20.04**.
 
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

* debian-7-wheezy
* debian-8-jessie
* debian-9-stretch
* debian-10-buster

### Ubuntu

* ubuntu-14_04-trusty
* ubuntu-16_04-xenial
* ubuntu-18_04-bionic

### Centos

* centos-6
* centos-7

## LXD native commands

Look at this [documentation](./LXD.md) for native LXD commands.
