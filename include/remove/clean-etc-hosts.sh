#!/bin/bash

showMessage " > Clean /etc/hosts file"
sudo sed -i "/$LXD_HOST/d" /etc/hosts
sudo sed -i "/$LXD_IP/d" /etc/hosts
