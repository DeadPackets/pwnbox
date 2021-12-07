#!/bin/bash

# Set up the shell
cp -a /etc/skel/. /root/
{
	echo 'export PATH=$PATH:/root/.local/bin:/usr/share/doc/python3-impacket/examples/';
	echo 'export LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8'
	echo "export DISPLAY=$DISPLAY"
	echo "export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'"
} >> /root/.zshrc
touch /root/.hushlogin
cp /setup/banner.sh /etc/profile.d/banner.sh

# Generate SSH keys
ssh-keygen -b 2048 -t rsa -q -N "" < /dev/zero

# Copy public keys into SSH
PUBLIC_KEYS=$(ls /opt/ssh/*.pub)

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
		cat "$key" >> /root/.ssh/authorized_keys.import
	done

	# Merge the two files
	sort /root/.ssh/authorized_keys.import /root/.ssh/authorized_keys.bak | uniq > /root/.ssh/authorized_keys
	rm /root/.ssh/authorized_keys.import /root/.ssh/authorized_keys.bak
	echo "Imported all keys!"
fi

# See if there is a startup script to run
if [[ -f /mnt/external/pwnbox_entrypoint.sh ]]; then
	chmod +x /mnt/external/pwnbox_entrypoint.sh
	/mnt/external/pwnbox_entrypoint.sh # run the script
fi

# Launch ssh
echo "Launching SSH..."
/usr/sbin/sshd -D -e
