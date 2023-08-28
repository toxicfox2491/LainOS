#!/usr/bin/env bash

source functions.sh

# Directories in $HOME directory
xdg-user-dirs-update
mkdir -p $HOME/Pictures/Screenshots

# For urxvt
xrdb -load $HOME/.Xresources

category Neovim
echo_p "Install some popular Neovim configuration stacks"

read -p "Do you want to install Neovim plugins? [y/N] : " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then

	echo_p "Installing kickstart"
	git clone https://github.com/nvim-lua/kickstart.nvim.git $HOME/.config/kickstart
	echo_p "Installing LazyVim"
	git clone https://github.com/LazyVim/starter $HOME/.config/LazyVim
	echo_p "Copying some extra files for LazyVim"
	cp -r ../assets/LazyVim/lua $HOME/.config/LazyVim
	echo_p "Installing AstroNvim"
	git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/AstroNvim
fi

category oh-my-zsh
echo_p "Install some popular plugins for oh-my-zsh"

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

category "Installing paru"
# Install paru
git clone https://aur.archlinux.org/paru.git $HOME/paru
cd $HOME/paru
makepkg -si

category "Install packages from the AUR"
# Packages from the AUR, easier to install with an AUR helper with a non-root user
paru -S --noconfirm --needed archlinux-tweak-tool-git ani-cli c-lolcat \
	librewolf-bin midnight-gtk-theme-git mpv-thumbfast-git mpv-uosc \
	sddm-lain-wired-theme tdrop tor-browser

category "Install fonts from the AUR"
paru -S --noconfirm --needed 3270-fonts ttf-envy-code-r ttf-victor-mono

# Generate openbox menu
obmenu-generator -p -i -u
