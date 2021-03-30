#!/bin/bash

# Make the scripts executable
chmod +x ./tools/*.sh

# Execute all tool scripts
for script in ./tools/*.sh; do
	echo "Executing $script..."
	bash "$script"
done

# Cleanup
apt autoremove -y
apt autoclean -y