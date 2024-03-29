#!/bin/bash

# Make our directory
mkdir -p /opt/tools/post
cd /opt/tools/post || exit

# * GIT INSTALLED TOOLS *

# PwnCat
apt-fast install -y libffi-dev
pip3 install --no-cache-dir pwncat-cs pwncat
echo "pwncat" >> /opt/tools/post/apt_tools.txt
echo "pwncat-cs" >> /opt/tools/post/apt_tools.txt

# Empire Framework
git clone --recursive --depth 1 --single-branch https://github.com/BC-SECURITY/Empire.git
cd Empire
yes | ./setup/install.sh
cd ..

# DeathStar
pipx install deathstar-empire
echo "deathstar-empire" >> /opt/tools/post/apt_tools.txt

# Chisel
mkdir -p chisel && cd chisel || exit
# I am not including all the chisel builds to save space
curl --silent https://api.github.com/repos/jpillora/chisel/releases/latest | jq .assets[].browser_download_url -r | grep -E "arm|amd|386" | grep -v "darwin" | xargs wget -q
cd ..

# PowerSploit
git clone https://github.com/PowerShellMafia/PowerSploit/

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