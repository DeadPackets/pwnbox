#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/web
cd /opt/tools/web || exit

# * APT INSTALLED TOOLS *
TOOLS=("ffuf" "sqlmap" "whatweb" "feroxbuster" "dirb" "gobuster" "nikto" "wfuzz" "httpie" "cewl" "recon-ng" "webshells")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/web/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# wpscan
gem install wpscan

# NoSQLMap
git clone --single-branch --depth 1 https://github.com/codingo/NoSQLMap

# wafw00f
git clone --single-branch --depth 1 https://github.com/EnableSecurity/wafw00f
