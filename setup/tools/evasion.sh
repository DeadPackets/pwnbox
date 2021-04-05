#!/bin/bash

# Make our directory
mkdir -p /opt/tools/evasion
cd /opt/tools/evasion

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
git clone https://github.com/tokyoneon/Chimera

# Invoke-Obfuscation
git clone https://github.com/danielbohannon/Invoke-Obfuscation

