#!/bin/bash

showMessage " > Upgrade default packages"

packageUpgrade

showMessage " > CleanUp Container"

containerCleanup
