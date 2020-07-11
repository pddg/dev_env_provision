#!/bin/bash

set -o pipefail

if [ "$(uname)" == 'Darwin'  ]; then
    if type python3 >/dev/null 2>&1; then
        brew install python3
    else
        echo "Python3 is installed."
    fi
    sudo pip3 install pipenv
else
    # RedHat distributions are not supported
    sudo apt update
    sudo apt install python3 python3-pip
    sudo pip3 install pipenv
fi

# Install dependencies
pipenv install

