#!/bin/bash

if [[ "${LXD_TEMPLATE_DEPRECATED}" == "1" ]]; then
    showError "Asked template is marked as DEPRECATED"
fi
