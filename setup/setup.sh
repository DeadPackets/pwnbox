#!/bin/bash

# Make the directories we need
mkdir -p /opt/tools
mkdir -p /opt/loot

# Make the scripts executable
chmod +x ./tools/*.sh

# Execute all tool scripts
for script in ./tools/*.sh; do
	echo "Executing $script..."
	bash "$script"
done

# Cleanup
apt autoremove
apt autoclean