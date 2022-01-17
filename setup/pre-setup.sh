#!/bin/bash

# Upgrade and install apt-fast
apt update && apt upgrade -y && \
	echo "deb http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main" > /etc/apt/sources.list.d/apt-fast.list && \
	apt install -y --no-install-recommends gnupg && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2166B8DE8BDC3367D1901C11EE2FF37CA8DA16B && \
	apt update && apt install -y apt-fast

# Install some essentials
apt-fast install --no-install-recommends -y build-essential locales man-db git wget curl python2.7 python3 python3-dev python3-pip python3-venv python3-setuptools netcat-openbsd ruby ruby-dev sudo jq nmap cmake && \
	apt-fast install --no-install-recommends -y python-is-python3

# Install pip2.7
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py -O /tmp/get-pip.py && python2.7 /tmp/get-pip.py && rm /tmp/get-pip.py

# Install wheel to allow faster pip installs
pip3 install wheel
python2.7 -m pip install wheel

# Set the locale
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
	locale-gen && \
	locale -a

# Install SSH
echo "root:toor" | chpasswd && \
	apt-fast install --no-install-recommends -y openssh-server openssh-client && \
	chmod 600 /etc/ssh/ssh_host_* && \
	mkdir -p /var/run/sshd

# Setting up the shell
apt-fast install --no-install-recommends -y zsh grc command-not-found
chsh -s /bin/zsh

# Setting up X11 Forwarding
apt-fast install -y xauth
touch /root/.Xauthority

# Set up the shell
touch /root/.hushlogin
cp /setup/banner.sh /etc/profile.d/banner.sh

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH plugins
git clone --single-branch --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --single-branch --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Powerlevel10k
git clone --single-branch --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy and use custom .zshrc
cp /setup/files/.zshrc /root/.zshrc
cp /setup/files/.p10k.zsh /root/.p10k.zsh

# Fetch gitstatusd to prevent startup message
mkdir -p /root/.cache
mkdir -p /root/.cache/gitstatus
wget https://github.com/romkatv/gitstatus/releases/download/v1.5.1/gitstatusd-linux-x86_64.tar.gz -O /root/.cache/gitstatus/tmp.tar.gz
tar xvzf /root/.cache/gitstatus/tmp.tar.gz --directory /root/.cache/gitstatus/
rm -rf /root/.cache/gitstatus/tmp.tar.gz