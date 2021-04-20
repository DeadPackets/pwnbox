#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/crypto
cd /opt/tools/crypto

# * APT INSTALLED TOOLS *
TOOLS=("hash-identifier")
apt-fast install --no-install-recommends -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/crypto/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# xortool
pip3 install xortool
echo "xortool" >> /opt/tools/crypto/apt_tools.txt

# ciphey
pip3 install ciphey --upgrade
echo "ciphey" >> /opt/tools/crypto/apt_tools.txt

# RsaCtfTool
git clone --single-branch --depth 1 https://github.com/Ganapati/RsaCtfTool.git
apt-fast --no-install-recommends install libgmp3-dev libmpc-dev -y
pip_install_reqs "RsaCtfTool" "3"
