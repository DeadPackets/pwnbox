#!/bin/bash

# Include our functions
source functions.sh

# Make our directory
mkdir -p /opt/tools/reverse
cd /opt/tools/reverse

# * APT INSTALLED TOOLS *
TOOLS=("strace" "ltrace" "radare2" "gdb")
apt install -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/reverse/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

