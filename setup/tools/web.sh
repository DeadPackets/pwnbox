#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/web
cd /opt/tools/web || exit

# * APT INSTALLED TOOLS *
TOOLS=("ffuf" "sqlmap" "whatweb" "dirb" "gobuster" "nikto" "wfuzz" "httpie" "cewl" "recon-ng" "webshells")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/web/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# wpscan
gem install wpscan

# XSSStrike
git clone --single-branch --depth 1 https://github.com/s0md3v/XSStrike
pip_install_reqs "XSStrike" "3"

# Arjun
git clone --single-branch --depth 1 https://github.com/s0md3v/Arjun
python_setup_install "Arjun" "3"

# NoSQLMap
git clone --single-branch --depth 1 https://github.com/codingo/NoSQLMap

# SSRFMap
git clone --single-branch --depth 1 https://github.com/swisskyrepo/SSRFmap
pip_install_reqs "SSRFmap" "3"

# jwt_tool
git clone --single-branch --depth 1 https://github.com/ticarpi/jwt_tool
pip_install_reqs "jwt_tool" "3"

# wafw00f
git clone --single-branch --depth 1 https://github.com/EnableSecurity/wafw00f

# dirsearch
git clone --single-branch --depth 1 https://github.com/maurosoria/dirsearch
pip_install_reqs "dirsearch" "3"

# tplmap
git clone --single-branch --depth 1 https://github.com/epinna/tplmap
pip_install_reqs "tplmap" "2"

