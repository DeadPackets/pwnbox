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

# Cleanup
apt autoremove -y
apt autoclean -y