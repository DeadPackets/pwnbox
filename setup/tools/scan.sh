#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/scan
cd /opt/tools/scan || exit

# * GIT INSTALLED TOOLS *

# AutoRecon
pip3 install --no-cache-dir git+https://github.com/Tib3rius/AutoRecon.git
echo "autorecon" >> /opt/tools/scan/apt_tools.txt

# nmapAutomator
git clone --single-branch --depth 1 https://github.com/21y4d/nmapAutomator.git

# RustScan
curl --silent https://api.github.com/repos/RustScan/RustScan/releases/latest | jq .assets[].browser_download_url -r | grep "amd64" | xargs wget -q -O rustscan.deb
dpkg -i rustscan.deb && rm rustscan.deb
echo "rustscan" >> /opt/tools/scan/apt_tools.txt