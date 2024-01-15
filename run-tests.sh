#!/bin/bash

# First install all updates
sudo apt update && sudo apt upgrade -y

# Wrapped this in if statement to only install of pts isn't present already
if [ ! -f /usr/bin/phoronix-test-suite ]; then
	wget -O phoronix.deb https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.4_all.deb
	sudo dpkg -i phoronix.deb
	sudo apt --fix-broken install -y
fi

if [ ! ~/.phoronix-test-suite ]
	then
		mkdir ~/.phoronix-test-suite
fi

cp -R benchmarks.txt installed-tests/ ~/.phoronix-test-suite
rm phoronix.deb

# run graphics Benchmark based on YA Quake with OpenGL 3.0 and Anisotropic Filtering and Multisample Antialiasing on
phoronix-test-suite benchmark 2401152-NE-YQUAKEALL70
