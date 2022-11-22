#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/util
cd /opt/tools/util || exit

# * APT INSTALLED UTILS *
apt-fast install --no-install-recommends -y nano tmux watch htop ftp inetutils-ping nfs-common openvpn

# * APT INSTALLED TOOLS *
TOOLS=("nano" "tmux" "watch" "htop" "ftp" "inetutils-ping" "nfs-common" "openvpn")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/util/apt_tools.txt
done

# * GIT INSTALLED UTILS *

# Arsenal
pip3 install --no-cache-dir arsenal-cli
echo "arsenal-cli" >> /opt/tools/util/apt_tools.txt

# Updog
pip3 install --no-cache-dir updog
echo "updog" >> /opt/tools/util/apt_tools.txt

# Shellterator
git clone --depth=1 --single-branch https://github.com/ShutdownRepo/shellerator
python_setup_install "shellerator" "3"
rm -rf shellerator
echo "shellerator" >> /opt/tools/util/apt_tools.txt

# Uberfile
git clone --depth=1 --single-branch https://github.com/ShutdownRepo/uberfile
python_setup_install "uberfile" "3"
rm -rf uberfile
echo "uberfile" >> /opt/tools/util/apt_tools.txt
