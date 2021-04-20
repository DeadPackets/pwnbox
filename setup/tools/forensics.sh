#!/bin/bash

# Include our functions
source functions.sh

# Make our directory
mkdir -p /opt/tools/forensics
cd /opt/tools/forensics

# * APT INSTALLED TOOLS *
TOOLS=("foremost" "apktool" "binwalk" "steghide" "stegsnow" "exiftool" "groff" "tcpflow" "tesseract-ocr")
apt-fast install -y ${TOOLS[@]}
for tool in "${TOOLS[@]}"
do
	:
	echo "$tool" >> /opt/tools/forensics/apt_tools.txt
done

# * GIT INSTALLED TOOLS *

# Zsteg
gem install zsteg
echo "zsteg" >> /opt/tools/forensics/apt_tools.txt

# Jsteg
wget https://github.com/lukechampine/jsteg/releases/download/v0.3.0/jsteg-linux-amd64 -O /usr/local/bin/jsteg
wget https://github.com/lukechampine/jsteg/releases/download/v0.3.0/slink-linux-amd64 -O /usr/local/bin/slink
chmod +x /usr/local/bin/jsteg /usr/local/bin/slink
echo "jsteg" >> /opt/tools/forensics/apt_tools.txt


# Katana
apt	install -y python-tk tk-dev libffi-dev libssl-dev pandoc libgmp3-dev libzbar-dev tesseract-ocr xsel libpoppler-cpp-dev libmpc-dev libdbus-glib-1-dev ruby libenchant-2-dev apktool nodejs groff binwalk foremost tcpflow poppler-utils exiftool steghide stegsnow bison ffmpeg libgd-dev less libpoppler-cpp-dev pkg-config python3-dbus qpdf
ln -s /usr/bin/stegsnow /usr/bin/snow
git clone https://github.com/JohnHammond/katana
python_setup_install "katana" "3"
