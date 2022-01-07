#!/bin/bash


# * APT INSTALLED UTILS *
apt-fast install --no-install-recommends -y nano tmux watch micro htop ftp inetutils-ping nfs-common openvpn

# * GIT INSTALLED UTILS *

# OpenVPN - enable IPv6 to allow connection with HTB
sysctl net.ipv6.conf.all.disable_ipv6=0

