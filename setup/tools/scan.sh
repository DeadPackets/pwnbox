#!/bin/bash

# Include our functions
source /setup/functions.sh

# Make our directory
mkdir -p /opt/tools/scan
cd /opt/tools/scan || exit

# * GIT INSTALLED TOOLS *

# AutoRecon
pip3 install --no-cache-dir git+https://github.com/Tib3rius/AutoRecon.git
echo "autorecon" >> /opt/tools/scan/apt_tools.txt

# RustScan
git clone --single-branch --depth 1 https://github.com/RustScan/RustScan
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "/root/.cargo/env"
cd RustScan
cargo build --release
cp target/release/rustscan /usr/local/bin
cd ..
rm -rf RustScan
yes | rustup self uninstall
echo "rustscan" >> /opt/tools/scan/apt_tools.txt
