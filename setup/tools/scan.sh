#!/bin/bash

# Include our functions
source functions.sh

# Make our directory
mkdir -p /opt/tools/scan
cd /opt/tools/scan

# * GIT INSTALLED TOOLS *

# AutoRecon
pip3 install git+https://github.com/Tib3rius/AutoRecon.git
echo "autorecon" >> /opt/tools/scan/apt_tools.txt

# nmapAutomator
git clone https://github.com/21y4d/nmapAutomator.git
