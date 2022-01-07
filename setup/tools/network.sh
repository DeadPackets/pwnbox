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
pip3 install pipx
pipx ensurepath
pipx install crackmapexec

# Responder
git clone --single-branch --depth 1 https://github.com/lgandx/Responder

# enum4linux-ng
git clone --single-branch --depth 1 https://github.com/cddmp/enum4linux-ng
pip_install_reqs "enum4linux-ng" "3"

# DeathStar
pipx install deathstar-empire

# ADRecon
git clone --single-branch --depth 1 https://github.com/adrecon/ADRecon.git

# ActiveDirectoryEnumeration
git clone --single-branch --depth 1 https://github.com/CasperGN/ActiveDirectoryEnumeration

# Impacket
git clone --single-branch --depth 1 https://github.com/SecureAuthCorp/impacket