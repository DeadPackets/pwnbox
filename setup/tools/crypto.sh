#!/bin/bash

# Include our functions
source functions.sh

# Make our directory
mkdir -p /opt/tools/crypto
cd /opt/tools/crypto

# * APT INSTALLED TOOLS *
TOOLS=("hash-identifier")
apt-fast install -y ${TOOLS[@]}
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
git clone https://github.com/Ganapati/RsaCtfTool.git
sudo apt-get install libgmp3-dev libmpc-dev -y
pip_install_reqs "RsaCtfTool" "3"
