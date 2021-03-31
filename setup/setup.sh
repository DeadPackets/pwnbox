#!/bin/bash

# Make the scripts executable
chmod +x ./tools/*.sh

# Execute all tool scripts
# for script in ./tools/*.sh; do
# 	echo "Executing $script..."
# 	bash "$script"
# done

# Setting up the shell
apt install -y zsh zsh-syntax-highlighting zsh-autosuggestions command-not-found
update-command-not-found && apt-file update
chsh -s /bin/zsh
cp -a /etc/skel/. /root/
echo 'export PATH=$PATH:/root/.local/bin:/usr/share/doc/python3-impacket/examples/' >> /root/.zshrc
touch /root/.hushlogin
cp /setup/banner.sh /etc/profile.d/banner.sh

# Cleanup
apt autoremove -y
apt autoclean -y