#!/usr/bin/env bash
if [ -x {{ xkeysnail_path.stdout }} ]; then
    xhost +SI:localuser:xkeysnail
    sudo -u xkeysnail DISPLAY=:1 {{ xkeysnail_path.stdout }} {{ xkeysnail_config_dir }}/config.py &
fi
