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
		pacman -S --noconfirm --needed $1
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

function help() {
	echo_caption "-- $NAME Version: $VERSION --"
	echo
	echo_primary "Description :"
	echo_secondary "	This script helps you to customize a fresh Arch Linux installation to convert it into LainOS. Manual intervention could be needed.\n"
	echo
	echo "-------------"
	echo_primary "Arguments :"
	echo_secondary "-h/--help"
	echo_info "help command"
}

function plymouth_hellonavi() {
	git clone https://github.com/yi78/hellonavi.git /usr/share/plymouth/themes/

	# Change plymouth theme
	update-alternatives --install /usr/share/plymouth/themes/default.plymouth \
		default.plymouth /usr/share/plymouth/themes/hellonavi/hellonavi/hellonavi.plymouth 100
	update-alternatives --config default.plymouth
	update-initramfs -u
	plymouth-set-default-theme -R hellonavi
}
