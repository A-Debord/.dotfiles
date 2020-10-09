all-conf:
	stow i3
	stow git
	stow zsh
	stow bash

install:
	# zsh
	apt update
	apt install zsh curl
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# i3
	/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2020.02.03_all.deb keyring.deb SHA256:c5dd35231930e3c8d6a9d9539c846023fe1a08e4b073ef0d2833acd815d80d48
	dpkg -i ./keyring.deb
	echo "deb [arch=amd64] https://debian.sur5r.net/i3/ $(shell grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" > /etc/apt/sources.list.d/sur5r-i3.list
	apt update
	apt install i3

setup: install all-conf

default: all-conf