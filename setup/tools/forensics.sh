#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/forensics
cd /opt/tools/forensics || exit

# * APT INSTALLED TOOLS *
TOOLS=("foremost" "binwalk" "steghide" "exiftool" "file")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/forensics/apt_tools.txt
done

# * GIT INSTALLED TOOLS *
