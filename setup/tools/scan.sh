#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/scan
cd /opt/tools/scan

# * GIT INSTALLED TOOLS *

# AutoRecon
pip3 install git+https://github.com/Tib3rius/AutoRecon.git
echo "autorecon" >> /opt/tools/scan/apt_tools.txt

# nmapAutomator
git clone --single-branch --depth 1 https://github.com/21y4d/nmapAutomator.git
