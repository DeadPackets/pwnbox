#!/bin/bash

# Include our functions
source functions.sh

# Make our directory
mkdir -p /opt/tools/web
cd /opt/tools/web

# * APT INSTALLED TOOLS *
TOOLS=("ffuf" "sqlmap" "whatweb" "dirb" "gobuster" "nikto" "wfuzz" "wpscan" "httpie" "cewl" "recon-ng" "webshells")
apt install -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/web/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# Arjun
git clone https://github.com/s0md3v/Arjun
python_setup_install "Arjun" "3"

# NoSQLMap
git clone https://github.com/codingo/NoSQLMap

# SSRFMap
git clone https://github.com/swisskyrepo/SSRFmap
pip_install_reqs "SSRFmap" "3"

# jwt_tool
git clone https://github.com/ticarpi/jwt_tool
pip_install_reqs "jwt_tool" "3"

# wafw00f
git clone https://github.com/EnableSecurity/wafw00f

# dirsearch
git clone https://github.com/maurosoria/dirsearch
pip_install_reqs "dirsearch" "3"

# tplmap
git clone https://github.com/epinna/tplmap
pip_install_reqs "tplmap" "3"

