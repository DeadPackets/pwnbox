#!/bin/bash

# Make our directory
mkdir -p /opt/tools/web
cd /opt/tools/web

# * APT INSTALLED TOOLS *
apt install -y ffuf sqlmap whatweb dirb gobuster jboss-autopwn joomscan nikto wfuzz wpscan httpie cewl webshells

# * GIT INSTALLED TOOLS *

# Arjun
git clone https://github.com/s0md3v/Arjun

# NoSQLMap
git clone https://github.com/codingo/NoSQLMap

# SSRFMap
git clone https://github.com/swisskyrepo/SSRFmap
cd SSRFMap && pip3 install -r requirements.txt && cd ..

# jwt_tool
git clone https://github.com/ticarpi/jwt_tool
cd jwt_tool && pip3 install -r requirements.txt && cd ..

# wafw00f
git clone https://github.com/EnableSecurity/wafw00f

# dirsearch
git clone https://github.com/maurosoria/dirsearch
cd dirsearch && pip3 install -r requirements.txt && cd ..

# tplmap
git clone https://github.com/epinna/tplmap
cd tplmap && pip3 install -r requirements.txt && cd ..

