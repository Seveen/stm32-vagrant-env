#!/usr/bin/env bash

# set -x

# Code is stored in the VM itself
# CODE_ROOT=/home/vagrant

# Code is stored in a directory shared between the VM and the host.
CODE_ROOT=/vagrant
WORKING_DIR_NAME=code
DEV_ENV="${CODE_ROOT}/${WORKING_DIR_NAME}"
TEMPLATE_REPO="https://gitlab.com/Seveen/stm32-minimal.git"

# test if the dev_env directory already exists
if [ -d "$DEV_ENV" ]; then
    echo "WARNING: Working directory ${DEV_ENV} already exists, skipping git clone"
else
    # Clone the modules source code. If there was a alternative git URL
    # provided as an argument to this script, than it will be clone.
    # Otherwise, the default MI repo will be cloned.
    cd $CODE_ROOT
    # Get from the original repo.
    git clone $TEMPLATE_REPO $WORKING_DIR_NAME
    if [ -d "$DEV_ENV" ]; then
        cd $DEV_ENV
    else
        echo "WARNING: Git clone didn't work. Clone repo manually"
        mkdir $DEV_ENV
        cd $DEV_ENV
    fi
fi

# after logging in, cd directly to the code directory
echo "cd $DEV_ENV" >> ~/.bashrc
