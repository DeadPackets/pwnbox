#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/crypto
cd /opt/tools/crypto || exit

# * APT INSTALLED TOOLS *
# TOOLS=("")
# apt-fast install --no-install-recommends -y "${TOOLS[@]}"
# for tool in "${TOOLS[@]}"
# do
# 	:
# 	echo "$tool" >> /opt/tools/crypto/apt_tools.txt
# done

# * GIT INSTALLED TOOLS *

# xortool
pip3 install --no-cache-dir xortool
echo "xortool" >> /opt/tools/crypto/apt_tools.txt

# RsaCtfTool
git clone --single-branch --depth 1 https://github.com/RsaCtfTool/RsaCtfTool
apt-fast --no-install-recommends install libgmp3-dev libmpc-dev -y
pip_install_reqs "RsaCtfTool" "3"