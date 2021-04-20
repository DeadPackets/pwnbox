#!/bin/bash

if [[ $NO_WORDLISTS != 'yes' ]];
then
	# Make our directory
	mkdir -p /opt/tools/wordlists
	cd /opt/tools/wordlists

	# * APT INSTALLED TOOLS *

	TOOLS=("seclists")
	apt-fast install -y ${TOOLS[@]}
	for tool in "${TOOLS[@]}"
	do
		:
		echo "$tool" >> /opt/tools/wordlists/apt_tools.txt
	done

	# * GIT INSTALLED TOOLS *

	# RobotsDisallowed
	git clone https://github.com/danielmiessler/RobotsDisallowed

	# FuzzDB
	git clone https://github.com/fuzzdb-project/fuzzdb --depth 1
fi