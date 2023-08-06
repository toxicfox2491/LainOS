#!/bin/bash

# ---------------------------------------------------------------------------
#
# Script to automate (as much as possible) LainOS ricing starting from a
# fresh install of Arch Linux.
#
# The idea is to run this script with the just created user.
#
# Read the scripts before running them.
#
# Created by hasecilu & LainOS team
#
# NAME: LainOS ricer 4 Arch,  Part 2: non-root user
# VERSION: 0.3
#
# ---------------------------------------------------------------------------

if [ "$EUID" -eq 0 ]; then
	echo "Please run as non-root user."
	echo
	exit
else
	xdg-user-dirs-update

	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..

	# Packages from the AUR, easier to install with an AUR helper
	paru -S alttab c-lolcat mpv-thumbfast-git mpv-uosc sddm-lain-wired-theme tor-browser

	read -p "Do you want to install zsh plugins? [y/N] : " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]; then

		# Install oh-my-zsh
		echo_p "Installing oh-my-zsh"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

		# Install power-level-10k
		echo_p "Installing power-level-10k"
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
			${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

		# Install  zsh-syntax-highlighting
		echo_p "Installing zsh-syntax-highlighting"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
			${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

		# Install  zsh-autosuggestions
		echo_p "Installing zsh-autosuggestions"
		git clone https://github.com/zsh-users/zsh-autosuggestions \
			${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	fi
fi
