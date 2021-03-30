#!/bin/bash

# Make our directory
mkdir -p /opt/tools/network
cd /opt/tools/network

# * APT INSTALLED TOOLS *
TOOLS=("smbmap" "responder" "crackmapexec" "enum4linux" "nbtscan" "onesixtyone" "oscanner" "smbclient" "smtp-user-enum" "snmp" "sslscan" "sipvicious" "tnscmd10g" "wkhtmltopdf" "hydra" "droopescan" "joomscan" "odat" "snmpcheck" "ldapscripts" "dnsrecon")
apt install -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/network/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# RustScan
curl --silent https://api.github.com/repos/RustScan/RustScan/releases/latest | jq .assets[].browser_download_url -r | grep "amd64" | xargs wget -q -O rustscan.deb
dpkg -i rustscan.deb && rm rustscan.deb
echo "rustscan" >> /opt/tools/network/apt_tools.txt


