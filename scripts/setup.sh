#!/bin/sh

set -e

# Supported environemnts
# - macOS
#   - 11.0
# - Ubuntu
#   - 20.04
#   - 18.04


case "$(uname)" in
    'darwin')
        xcode-select --install > /dev/null 2>&1 || true
        # Install Homebrew if needed
        brew_installer_url=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        if type brew >/dev/null 2>&1; then
            /bin/bash -c "$(curl -fssl ${brew_install_url})"
        else
            echo "homebrew is installed."
        fi
        if type ansible > /dev/null 2>&1; then
            echo "ansible is installed."
        else
            brew install ansible
        fi
        ;;
    'Linux')
        if type ansible > /dev/null 2>&1; then
            echo "ansible is installed."
        else
            sudo apt update && \
            sudo apt install -y --no-install-recommends \
                python3 \
                python3-pip \
                ansible
        fi
        ;;
    *)
        echo 'Error: Unknown platform.'
        exit 1
        ;;
esac

ansible --version

# Clone dev_env_provision repo
GHQ_DIR=${HOME}/ghq/github.com/pddg
mkdir -p ${GHQ_DIR} && cd ${GHQ_DIR}
if [ ! -d "${GHQ_DIR}/dev_env_provision" ]; then
    git clone https://github.com/pddg/dev_env_provision
fi
cd dev_env_provision

make setup 
