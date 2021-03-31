#!/bin/bash

PUBLIC_KEYS=$(ls /opt/ssh/*.pub)

# First check if the volume mounting messed up the home directory
if [[ -f /root/.zshrc ]]; then
	echo "Fixing the home directory..."
	cp -a /etc/skel/. /root/
	echo 'export PATH=$PATH:/root/.local/bin:/usr/share/doc/python3-impacket/examples/' >> /root/.zshrc
	touch /root/.hushlogin
fi

if [[ -z $PUBLIC_KEYS ]]; then
	echo "No public keys found! Only password based SSH will be available!"
else
	# Backup the original authorized_keys
	mkdir -p /root/.ssh
	touch /root/.ssh/authorized_keys
	cp /root/.ssh/authorized_keys /root/.ssh/authorized_keys.bak

	# Loop over the keys and import them
	for key in $PUBLIC_KEYS; do
		echo "Importing $key..."
		cat $key >> /root/.ssh/authorized_keys.import
	done

	# Merge the two files
	sort /root/.ssh/authorized_keys.import /root/.ssh/authorized_keys.bak | uniq > /root/.ssh/authorized_keys
	rm /root/.ssh/authorized_keys.import /root/.ssh/authorized_keys.bak
	echo "Imported all keys!"
fi

# Launch ssh
echo "Launching SSH..."
/usr/sbin/sshd -D -e