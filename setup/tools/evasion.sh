#!/bin/bash

# Make our directory
mkdir -p /opt/tools/evasion
cd /opt/tools/evasion || exit

# * APT INSTALLED TOOLS *

# TOOLS=()
# apt install -y ${TOOLS[@]}
# for tool in "${TOOLS[@]}"
# do
# 	:
# 	echo "$tool" >> /opt/tools/evasion/apt_tools.txt
# done

# * GIT INSTALLED TOOLS *

# Chimera
git clone --single-branch --depth 1 https://github.com/tokyoneon/Chimera

# Invoke-Obfuscation
git clone --single-branch --depth 1 https://github.com/danielbohannon/Invoke-Obfuscation