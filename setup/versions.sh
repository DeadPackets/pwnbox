#!/bin/bash

# Create a directory for this
mkdir -p /opt/versions

# Store all installed apt tools and their versions
cat /opt/tools/*/apt_tools.txt | sort | awk '{print "^"$0"/"}' > /tmp/apt_tools_grep.txt
apt list | grep -f apt_tools_grep.txt | sed 's/,now//g' | cut -d' ' -f1,2 > /opt/versions/apt_tools_versions.txt

# TODO: Finish this work