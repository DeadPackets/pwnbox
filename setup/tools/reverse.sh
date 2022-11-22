#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/reverse
cd /opt/tools/reverse || exit

# * APT INSTALLED TOOLS *
TOOLS=("strace" "ltrace" "gdb")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/reverse/apt_tools.txt
done

# * GIT INSTALLED TOOLS *
