#!/bin/bash

set -o pipefail

brew_installer_url=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

if [ "$(uname)" == 'Darwin'  ]; then
    if type brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL ${brew_install_url})"
    else
        echo "Homebrew is installed."
    fi
else
    echo "This platform does not support Homebrew."
fi

