#!/bin/bash

showMessage " > Clean knowhosts file"
ssh-keygen -R "$LXD_HOST" > /dev/null
ssh-keygen -R "$LXD_IP"   > /dev/null
