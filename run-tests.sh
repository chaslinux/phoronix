#!/bin/bash

# First install all updates
sudo apt update && sudo apt upgrade -y

# Wrapped this in if statement to only install of pts isn't present already
if [ ! -f /usr/bin/phoronix-test-suite ]; then
	wget -O phoronix.deb https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.4_all.deb
	sudo dpkg -i phoronix.deb
	sudo apt --fix-broken install -y
fi

if [ ! ~/.phoronix-test-suite/download-cache ]
	then
		mkdir -p ~/.phoronix-test-suite/download-cache
fi

cp -R benchmarks.txt installed-tests/ ~/.phoronix-test-suite
rm phoronix.deb

cd ~/.phoronix-test-suite/download-cache
scp cr-workstation4:/home/$USER/.phoronix-test-suite/download-cache/* .
cd ~

# run graphics Benchmark based on Xonotic at 1024x768 with High detail on
phoronix-test-suite benchmark 2401161-NE-XONOTIC1037
