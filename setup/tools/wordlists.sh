#!/bin/bash

if [[ $NO_WORDLISTS != 'yes' ]];
then
	# Make our directory
	mkdir -p /opt/tools/wordlists
	cd /opt/tools/wordlists

	# * APT INSTALLED TOOLS *

	# TOOLS=("")
	# apt-fast install --no-install-recommends -y ${TOOLS[@]}
	# for tool in "${TOOLS[@]}"
	# do
	# 	:
	# 	echo "$tool" >> /opt/tools/wordlists/apt_tools.txt
	# done

	# * GIT INSTALLED TOOLS *

	# SecLists
	git clone --single-branch --depth 1 https://github.com/danielmiessler/SecLists /usr/share/seclists

	# RobotsDisallowed
	git clone --single-branch --depth 1 https://github.com/danielmiessler/RobotsDisallowed

	# FuzzDB
	git clone --single-branch --depth 1 https://github.com/fuzzdb-project/fuzzdb
fi