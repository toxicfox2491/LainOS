#!/bin/bash

function message() {
	tput setaf "$1"
	echo "------------------------------------------------------------"
	echo "| > $2"
	echo "------------------------------------------------------------"
	echo
	tput sgr0
}

function category() {
	message 5 "Installing software for category $1"
}

function install() {
	if pacman -Qi "$1" &>/dev/null; then
		message 2 "The package $1 is already installed"
	else
		message 3 "Installing package $1"
		message 3 "--dry-run"
		# sudo pacman -S --noconfirm --needed $1
	fi
}

function install_list() {
	count=0
	list=("$@")
	n=${#list[@]}
	for name in "${list[@]}"; do
		count=$((count + 1))
		tput setaf 3
		echo "Installing package $count/$n: $name"
		tput sgr0
		install "$name"
	done
}

function main() {
	bash 100-display-manager-and-desktop.sh
	bash 110-development-software.sh
	bash 120-sound.sh
	bash 130-bluetooth.sh
	bash 140-printers.sh
	bash 150-samba.sh
	bash 160-laptop.sh
	bash 170-network-discovery.sh
	bash 200-software-arch-linux.sh
	bash 300-software-arcolinux-3rd-party.sh
	bash 400-software-arcolinux-xlarge.sh
	bash 500-software-distro-specific.sh
	bash 600-additional-arcolinux-software.sh
	bash 700-installing-fonts.sh
	bash 800-conky.sh
}

function help() {
	echo_caption "-- $NAME Version: $VERSION --"
	echo
	echo_primary "Description :"
	echo_secondary "	This script helps you to customize a fresh MX-Fluxbox installation to convert it into LainOS. Manual intervention could be needed.\n"
	echo
	echo "-------------"
	echo_primary "Arguments :"
	echo_secondary "-h/--help         "
	echo_info "help command"
}

function plymouth() {
	# Image size same as the display resolution
	cpl='./plymouth/copland-os/CoplandOS.png'
	wget -O cpl.png https://cutt.ly/20TMTf0
	if [[ $(xdpyinfo | awk '/dimensions/{print $2}') == 1920x1080 ]]; then
		ffmpeg -y -i cpl.png -vf scale=1920:1080 $cpl
	elif [[ $(xdpyinfo | awk '/dimensions/{print $2}') == 1366x768 ]]; then
		ffmpeg -y -i cpl.png -vf scale=1366:768 $cpl
	fi
	rm cpl.png
	sudo cp -rv ./plymouth/copland-os/ /usr/share/plymouth/themes/

	git clone https://github.com/yi78/hellonavi.git plymouth/hellonavi
	sudo cp -rv ./plymouth/hellonavi/hellonavi/ /usr/share/plymouth/themes/

	# Change plymouth theme
	sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/hellonavi/hellonavi.plymouth 100
	sudo update-alternatives --config default.plymouth
	sudo update-initramfs -u
	sudo plymouth-set-default-theme -R hellonavi
}

function sddm() {
	sudo nala install -y sddm
	sudo nala install -y qtmultimedia5-dev qml-module-qtquick-controls libqt5multimedia5-plugins qml-module-qtmultimedia

	git clone https://github.com/lll2yu/sddm-lain-wired-theme.git
	sudo mkdir /usr/share/sddm/themes
	sudo cp -rv sddm-lain-wired-theme /usr/share/sddm/themes/
	sudo cp -v sddm.conf /etc/
}

function fonts() {
	# Install Meslo fonts
	echo_p "Installing Meslo fonts"
	wget -P ~/.local/share/fonts/Meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
	wget -P ~/.local/share/fonts/Meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
	wget -P ~/.local/share/fonts/Meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
	wget -P ~/.local/share/fonts/Meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
}

function zsh() {
	echo_p "Installing zsh"
	sudo nala install -y zsh
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
		${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	# Install  zsh-autosuggestions
	echo_p "Installing zsh-autosuggestions"
	git clone https://github.com/zsh-users/zsh-autosuggestions \
		${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	cp -v home/.zshrc ~/
	cp -v home/.p10k.zsh ~/
}
