#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/network
cd /opt/tools/network || exit

# * APT INSTALLED TOOLS *
TOOLS=("smbmap" "enum4linux" "nbtscan" "onesixtyone" "oscanner" "smbclient" "smtp-user-enum" "snmp" "sslscan" "sipvicious" "tnscmd10g" "wkhtmltopdf" "hydra" "joomscan" "odat" "snmpcheck" "ldapscripts" "dnsrecon")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/network/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# CrackMapExec
pip3 install --no-cache-dir poetry pipx
pipx ensurepath
git clone --recursive --single-branch https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec && pipx install .

# Responder
git clone --single-branch --depth 1 https://github.com/lgandx/Responder

# enum4linux-ng
git clone --single-branch --depth 1 https://github.com/cddmp/enum4linux-ng
pip_install_reqs "enum4linux-ng" "3"

# ADRecon
git clone --single-branch --depth 1 https://github.com/adrecon/ADRecon.git

# ActiveDirectoryEnumeration
git clone --single-branch --depth 1 https://github.com/CasperGN/ActiveDirectoryEnumeration
pip_install_reqs "ActiveDirectoryEnumeration-ng" "3"
python_setup_install "ActiveDirectoryEnumeration" "3"

# Impacket
git clone --single-branch --depth 1 https://github.com/SecureAuthCorp/impacket

# Bloodhound (The GUI app)
apt-fast install -y bloodhound # It should install recommended packages, such as neo4j
echo "bloodhound" >> /opt/tools/network/apt_tools.txt

# Set the default neo4j password
echo "neo4j:bloodhound" > /opt/tools/network/neo4j_creds.txt
_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true" /usr/share/neo4j/bin/neo4j-admin set-initial-password bloodhound

# Bloodhound.py
pip3 install --no-cache-dir bloodhound

# SprayHound
echo "sprayhound" >> /opt/tools/network/apt_tools.txt
apt-fast install -y libldap2-dev libsasl2-dev libssl-dev
pip3 install sprayhound