#!/usr/bin/env bash

# WARNING: DON'T JUST RUN. OBSERVE, JUDGE, AMUSE AT YOUR OWN PERIL.

source functions.sh

# Directories in $HOME directory
xdg-user-dirs-update
mkdir -p "$HOME"/Pictures/Screenshots

# For urxvt
xrdb -load "$HOME"/.Xresources

# copying over files in skel directly to /home/USER
#this contains basically all the configs/dotfiles
cp -r ../etc/skel/. $HOME/

#category "Installing yay"
# Install paru
# not installing paru!!
# replaced with yay
#git clone  https://aur.archlinux.org/yay.git "$HOME"/yay
#cd "$HOME"/yay || return
#makepkg -si

category "Install packages from the AUR"
# Packages from the AUR, easier to install with an AUR helper with a non-root user
# took out ani-cli, if you still want to watch anime I recommend using anipy-cli instead
# removed tor browser from the list, if you need to use tor I'd imagine you want to install it yourself
yay -S --noconfirm --needed c-lolcat gpa kloak-git \
	mpv-{thumbfast-git,uosc} \
	sddm-lain-wired-theme tdrop wlogout wl-gammarelay-rs \
	xdg-ninja zenmap perl-linux-desktopfiles obmenu-generator hyfetch \
 	pyprland wl-clip-persist-git thunar kate

category "Install fonts from the AUR"
yay -S --noconfirm --needed 3270-fonts ttf-{agave,envy-code-r,victor-mono}

ln -s /usr/share/mpv/fonts "$HOME"/.config/mpv/
ln -s /usr/share/mpv/scripts/uosc "$HOME"/.config/mpv/scripts/
ln -s /usr/share/mpv/script-opts/uosc.conf "$HOME"/.config/mpv/script-opts/

# Block add domains
hblock

category oh-my-zsh
echo_p "Install some popular plugins for oh-my-zsh"

read -p "Do you want to install zsh plugins? [y/N] : " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo

	# Install oh-my-zsh
	echo_p "Installing oh-my-zsh"
	ZSH="$HOME"/.local/share/oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# Install power-level-10k
	echo_p "Installing power-level-10k"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
		"${ZSH_CUSTOM:-$HOME/.local/share/oh-my-zsh/custom}"/themes/powerlevel10k

	# Install zsh-syntax-highlighting
	echo_p "Installing zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
		"${ZSH_CUSTOM:-$HOME/.local/share/oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting

	# Install zsh-autosuggestions
	echo_p "Installing zsh-autosuggestions"
	git clone https://github.com/zsh-users/zsh-autosuggestions \
		"${ZSH_CUSTOM:-$HOME/.local/share/oh-my-zsh/custom}"/plugins/zsh-autosuggestions
fi

git clone https://github.com/junelva/wl-gammarelay-applet.git
cd wl-gammarelay-applet || return
cargo build --release
ln -s "$(pwd)"/target/release/wl-gammarelay-applet ~/.local/bin/wl-gammarelay-applet

# Generate openbox menu
obmenu-generator -p -i -u
