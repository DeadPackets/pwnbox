#!/bin/bash

# Make our directory
mkdir -p /opt/tools/network
cd /opt/tools/network

# * APT INSTALLED TOOLS *
TOOLS=("smbmap" "responder" "crackmapexec" "enum4linux" "nbtscan" "onesixtyone" "oscanner" "smbclient" "smtp-user-enum" "snmp" "sslscan" "sipvicious" "tnscmd10g" "wkhtmltopdf" "hydra" "joomscan" "odat" "snmpcheck" "ldapscripts" "dnsrecon")
apt-fast install --no-install-recommends -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/network/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# Droopescan
pip3 install --no-cache-dir droopescan
echo "droopescan" >> /opt/tools/network/apt_tools.txt

# RustScan
curl --silent https://api.github.com/repos/RustScan/RustScan/releases/latest | jq .assets[].browser_download_url -r | grep "amd64" | xargs wget -q -O rustscan.deb
dpkg -i rustscan.deb && rm rustscan.deb
echo "rustscan" >> /opt/tools/network/apt_tools.txt


