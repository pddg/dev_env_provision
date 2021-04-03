#!/bin/sh

set -e

# Supported environemnts
# - macOS
#   - 11.0
# - Ubuntu
#   - 20.04
#   - 18.04

# xcode-select --install
if [ "$(uname)" == 'darwin' ]; then
    xcode-select --install > /dev/null 2>&1 || true
fi

# Install Homebrew if needed
brew_installer_url=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

if [ "$(uname)" == 'darwin' ]; then
    if type brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fssl ${brew_install_url})"
    else
        echo "homebrew is installed."
    fi
fi

# Install ansible
if type ansible > /dev/null 2>&1; then
    echo "ansible is installed."
else
    if [ "$(uname)" == 'Darwin' ]; then
        brew install ansible
    else
        sudo apt update && \
        sudo apt install -y --no-install-recommends \
            python3 \
            python3-pip \
            ansible
    fi
fi

ansible --version

# Clone dev_env_provision repo
GHQ_DIR=${HOME}/ghq/github.com/pddg
mkdir -p ${GHQ_DIR} && cd ${GHQ_DIR}
git clone https://github.com/pddg/dev_env_provision
cd dev_env_provision

make setup 
