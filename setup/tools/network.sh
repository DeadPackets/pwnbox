#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/network
cd /opt/tools/network || exit

# * APT INSTALLED TOOLS *
TOOLS=("smbmap" "nbtscan" "onesixtyone" "smbclient" "smtp-user-enum" "snmp" "sslscan" "sipvicious" "tnscmd10g" "wkhtmltopdf" "hydra" "joomscan" "odat" "snmpcheck" "ldapscripts" "dnsrecon" "samba-common-bin" "enum4linux-ng")
apt-fast install --no-install-recommends -y "${TOOLS[@]}"
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/network/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# NetExec (CrackMapExec fork)
pip3 install --no-cache-dir poetry pipx
pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec
echo "netexec" >> /opt/tools/network/apt_tools.txt

# Responder
git clone --single-branch --depth 1 https://github.com/lgandx/Responder

# ADRecon
git clone --single-branch --depth 1 https://github.com/adrecon/ADRecon.git

# ActiveDirectoryEnumeration
pip3 install --no-cache-dir ActiveDirectoryEnum
echo "ActiveDirectoryEnumeration (python3 -m ade)" >> /opt/tools/network/apt_tools.txt

# Impacket
git clone --single-branch --depth 1 https://github.com/SecureAuthCorp/impacket

# Bloodhound.py
pip3 install --no-cache-dir bloodhound

# SprayHound
echo "sprayhound" >> /opt/tools/network/apt_tools.txt
apt-fast install -y libldap2-dev libsasl2-dev libssl-dev
pip3 install --no-cache-dir sprayhound

# Certipy
pip3 install --no-cache-dir certipy-ad
echo "certipy" >> /opt/tools/network/apt_tools.txt