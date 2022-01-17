#!/bin/bash


# * APT INSTALLED UTILS *
apt-fast install --no-install-recommends -y nano tmux watch htop ftp inetutils-ping nfs-common openvpn

# * GIT INSTALLED UTILS *

# Arsenal
pip3 install --no-cache-dir arsenal

# Updog
pip3 install --no-cache-dir updog

# Shellterator
git clone --depth=1 --single-branch https://github.com/ShutdownRepo/shellerator
python_setup_install "shellerator" "3"

# Uberfile
git clone --depth=1 --single-branch https://github.com/ShutdownRepo/uberfile
python_setup_install "uberfile" "3"
