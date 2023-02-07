#!/bin/bash

# First install all updates
sudo apt update && sudo apt upgrade -y

# Wrapped this in if statement to only install of pts isn't present already
if [ ! /usr/bin/phoronix-test-suite ]; then
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

# run benchmarks against our 1st gen Core iSeries laptop
phoronix-test-suite benchmark 2204138-TJ-LAPTOP50755
