#!/bin/bash

# Make the scripts executable
chmod +x ./tools/*.sh

# Execute all tool scripts
for script in ./tools/*.sh; do
	echo "Executing $script..."
	bash "$script"
done

# Setting up the shell
apt-fast install -y zsh zsh-syntax-highlighting zsh-autosuggestions command-not-found
chsh -s /bin/zsh
