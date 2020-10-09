all-conf:
	stow i3
	stow git
	
	rm ~/.zshrc
	stow zsh
	
	stow bash

all-install:
	# zsh
	sudo apt update
	sudo apt install zsh curl
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh || echo "oh my zsh is already installed"
	sudo chsh -s $(shell which zsh)

	# i3
	/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2020.02.03_all.deb keyring.deb SHA256:c5dd35231930e3c8d6a9d9539c846023fe1a08e4b073ef0d2833acd815d80d48
	sudo dpkg -i ./keyring.deb
	rm ./keyring.deb
	echo "deb [arch=amd64] https://debian.sur5r.net/i3/ $(shell grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
	sudo apt update
	sudo apt install i3

	# stow
	sudo apt install stow 

all: all-install all-conf

