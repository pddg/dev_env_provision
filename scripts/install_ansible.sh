#!/bin/bash

set -o pipefail

if type ansible > /dev/null 2>&1; then
    echo "ansible is installed."
    ansible --version
else
    if [ "$(uname)" == 'Darwin'  ]; then
        brew install ansible
    else
        # RedHat distributions are not supported
        sudo apt update && \
        sudo apt install -y --no-install-recommends \
            python3 \
            python3-pip \
            ansible
    fi
    ansible --version
fi
