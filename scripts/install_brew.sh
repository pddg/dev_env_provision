#!/bin/bash

set -o pipefail

brew_installer_url=https://raw.githubusercontent.com/Homebrew/install/master/install

if [ "$(uname)" == 'Darwin'  ]; then
    if type brew >/dev/null 2>&1; then
        /usr/bin/ruby -e "$(curl -fsSL $brew_installer_url)"
    else
        echo "Homebrew is installed."
    fi
else
    echo "This platform does not support Homebrew."
fi

