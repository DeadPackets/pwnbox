#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/pwn
cd /opt/tools/pwn

# * APT INSTALLED TOOLS *
TOOLS=("libc6-i386" "gdb")
apt-fast install --no-install-recommends -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/pwn/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# PEDA
git clone --single-branch --depth 1 https://github.com/longld/peda.git /root/.peda
echo "source /root/.peda/peda.py" >> ~/.gdbinit

# ROPGadget
pip3 install --no-cache-dir ropgadget
echo "ROPGadget" >> /opt/tools/pwn/apt_tools.txt

# PwnTools (both versions)
pip3 install --no-cache-dir pwntools
python2.7 -m pip install pwntools
echo "pwntools" >> /opt/tools/pwn/apt_tools.txt

# one_gadget
gem install one_gadget
echo "one_gadget" >> /opt/tools/pwn/apt_tools.txt

