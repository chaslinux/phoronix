#!/bin/bash

# First install all updates
sudo apt update && sudo apt upgrade -y

wget -O phoronix.deb https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.3_all.deb
sudo dpkg -i phoronix.deb
sudo apt --fix-broken install -y

if [ ! ~/.phoronix-test-suite ]
	then
		mkdir ~/.phoronix-test-suite
fi

cp -R benchmarks.txt installed-tests/ ~/.phoronix-test-suite
rm phoronix.deb

phoronix-test-suite benchmark 2204138-TJ-LAPTOP50755
