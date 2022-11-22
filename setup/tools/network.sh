#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/network
cd /opt/tools/network || exit

# * APT INSTALLED TOOLS *
TOOLS=("smbmap" "nbtscan" "onesixtyone" "smbclient" "smtp-user-enum" "snmp" "sslscan" "sipvicious" "tnscmd10g" "wkhtmltopdf" "hydra" "joomscan" "odat" "snmpcheck" "ldapscripts" "dnsrecon" "samba-common-bin")
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
pipx install crackmapexec

# Responder
git clone --single-branch --depth 1 https://github.com/lgandx/Responder

# enum4linux-ng
git clone --single-branch --depth 1 https://github.com/cddmp/enum4linux-ng
pip_install_reqs "enum4linux-ng" "3"
python_setup_install "enum4linux-ng" "3"
rm -rf enum4linux-ng
echo "enum4linux-ng" >> /opt/tools/network/apt_tools.txt

# ADRecon
git clone --single-branch --depth 1 https://github.com/adrecon/ADRecon.git

# ActiveDirectoryEnumeration
git clone --single-branch --depth 1 https://github.com/CasperGN/ActiveDirectoryEnumeration
pip_install_reqs "ActiveDirectoryEnumeration-ng" "3"
SETUPTOOLS_USE_DISTUTILS=stdlib python_setup_install "ActiveDirectoryEnumeration" "3"
rm -rf ActiveDirectoryEnumeration
echo "ActiveDirectoryEnumeration (python3 -m ade)" >> /opt/tools/network/apt_tools.txt

# Impacket
git clone --single-branch --depth 1 https://github.com/SecureAuthCorp/impacket

# Bloodhound.py
pip3 install --no-cache-dir bloodhound

# SprayHound
echo "sprayhound" >> /opt/tools/network/apt_tools.txt
apt-fast install -y libldap2-dev libsasl2-dev libssl-dev
pip3 install sprayhound