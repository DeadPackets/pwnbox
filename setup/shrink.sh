#!/bin/bash

# Remove all .git/ folders in the image
find / -type d -name .git -prune -exec rm -rf {} \;

# Remove all non-copyright files in /usr/share/doc
find /usr/share/doc/* -type f ! -iname "*copyright*" -exec rm -f {} \;

# Remove all non-english locale
find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' -exec rm -rf {} \;

# Remove unneeded files
rm -rf /usr/share/info/* /usr/share/groff/*

# Remove pip cache
rm -rf /root/.cache/pip

# Remove openjdk (dont know why its installed tbh)
apt-fast remove default-jdk default-jre-headless -y

# Shrink seclists
cd /usr/share || exit
tar -c --lzma -v --exclude-vcs -f seclists.tar.lzma seclists
rm -rf seclists/
