#!/bin/bash

source functions.sh

category Additional-distro-specific

list=(
	arandr
	#dmenu
	feh
	geany
	gmrun
	gtk2-perl
	gtk-engine-murrine
	imagemagick
	lxappearance-obconf
	lxrandr
	nitrogen
	obconf
	obmenu3
	obmenu-generator
	perl-linux-desktopfiles
	picom
	playerctl
	python-pywal
	tint2
	urxvt-resize-font-git
	volumeicon
	w3m
	xcape
	xfce4-appfinder
	xfce4-power-manager
	xfce4-screenshooter
	xfce4-settings
	xfce4-taskmanager
	xfce4-terminal
	hardcode-fixer-git
)

install_list "${list[@]}"

# echo "Fixing hardcoded icon paths for applications - Wait for it"
# sudo hardcode-fixer

message 11 "Software has been installed"
