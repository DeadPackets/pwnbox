#!/bin/bash

# Include our functions
source functions.sh

# Make our directory
mkdir -p /opt/tools/scan
cd /opt/tools/scan

# * GIT INSTALLED TOOLS *

# AutoRecon
git clone https://github.com/Tib3rius/AutoRecon
pip_install_reqs "AutoRecon" "3"

# nmapAutomator
git clone https://github.com/21y4d/nmapAutomator.git
