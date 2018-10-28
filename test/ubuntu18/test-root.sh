#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get -y -qq install apache2 > /dev/null
apt-get -y -qq install php-cli > /dev/null
systemctl restart apache2
