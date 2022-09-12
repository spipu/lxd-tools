#!/bin/bash

if [[ "${LXD_TEMPLATE_DEPRECATED}" == "1" ]]; then
    showWarning "Current template is marked as DEPRECATED"
    showWarning "If you remove this LXD, you will not be able to recreate it in the future!"
    showWarning "Do you really want to continue?!"
    exit 1
fi
