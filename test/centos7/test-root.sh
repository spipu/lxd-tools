#!/usr/bin/env bash

yum -y -q install httpd   > /dev/null
yum -y -q install php-cli > /dev/null
systemctl restart httpd
