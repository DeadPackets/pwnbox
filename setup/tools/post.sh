#!/bin/bash

# Make our directory
mkdir -p /opt/tools/post
cd /opt/tools/post || exit

# * GIT INSTALLED TOOLS *

# Chisel
mkdir -p chisel && cd chisel || exit
# I am not including all the chisel builds to save space
curl --silent https://api.github.com/repos/jpillora/chisel/releases/latest | jq .assets[].browser_download_url -r | grep -E "arm|amd|386" | grep -v "darwin" | xargs wget -q
cd ..

# PowerSploit
git clone https://github.com/PowerShellMafia/PowerSploit/

# docker-escape
curl --silent https://api.github.com/repos/PercussiveElbow/docker-escape-tool/releases/latest | jq .assets[].browser_download_url -r | xargs wget -q

# les.sh
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O les.sh

# PEAS
git clone --single-branch --depth 1 https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite peas

# pspy
mkdir -p pspy && cd pspy || exit
curl --silent https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq .assets[].browser_download_url -r | xargs wget -q
cd ..

# WinPwn
git clone --single-branch --depth 1 https://github.com/S3cur3Th1sSh1t/WinPwn