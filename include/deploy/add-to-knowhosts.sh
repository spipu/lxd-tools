#!/bin/bash

showMessage " > Add to KnowHost"
if ! ssh-keygen -F $LXD_HOST > /dev/null ; then
    ssh-keyscan $LXD_HOST 2> /dev/null >>  ~/.ssh/known_hosts
fi
if ! ssh-keygen -F $LXD_IP > /dev/null ; then
    ssh-keyscan $LXD_IP 2> /dev/null >>  ~/.ssh/known_hosts
fi
