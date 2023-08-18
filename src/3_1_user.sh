#!/bin/bash

source functions.sh

# Directories in $HOME directory
xdg-user-dirs-update
mkdir -p $HOME/Pictures/Screenshots

# For urxvt
xrdb -load $HOME/.Xresources

# Add command to listen to Lain radio
mkdir -p $HOME/.bin
cp ../assets/radio $HOME/.bin

category Install paru
# Install paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

category Packages from the AUR
# Packages from the AUR, easier to install with an AUR helper with a non-root user
paru -S --noconfirm --needed alttab c-lolcat mpv-thumbfast-git \
	mpv-uosc sddm-lain-wired-theme tdrop tor-browser

category Fonts from the AUR
paru -S --noconfirm --needed 3270-fonts ttf-envy-code-r ttf-victor-mono

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

# Generate openbox menu
obmenu-generator -p -i -u
