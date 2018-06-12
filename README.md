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

The available templates are:

* debian-7-wheezy
* debian-8-jessie
* debian-9-stretch

## LXD native commands

Look at this [documentation](./LXD.md) for native LXD commands.
