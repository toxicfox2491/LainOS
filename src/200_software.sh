#!/bin/bash

source functions.sh

# Base #########################################################################

category Accessories
list=(variety mintstick-git)
install_list "${list[@]}"

category Development
list=(ctags curl gcc gdb git git-delta jq lazygit make meld
	neovim onefetch scrot shellcheck valgrind wget)
install_list "${list[@]}"

category Games
list=(0ad supertux)
install_list "${list[@]}"

category Graphics
list=(gimp inkscape nsxiv)
install_list "${list[@]}"

category Internet
list=(deluge)
install_list "${list[@]}"

category Multimedia
list=(mpv peek)
install_list "${list[@]}"

category Office
list=(evince)
install_list "${list[@]}"

category Privacy
list=(tor keepassxc)
install_list "${list[@]}"

category System
list=(dconf-editor arc-gtk-theme openbox-arc-git inxi)
install_list "${list[@]}"

category Terminal
list=(asciinema asciiquarium bat broot btop c-lolcat cmatrix duf dust exiftool
	fd ffmpeg figlet htop lsd neofetch onefetch procs python-pywal
	rclone ripgrep sl sqlite tldr tmux vnstat xdg-ninja xsel yt-dlp)
install_list "${list[@]}"

category Unpack
list=(unace unrar zip unzip sharutils uudeview arj cabextract file-roller)
install_list "${list[@]}"

# ArcoLinux ####################################################################

category ArcoLinux

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
list=(
	arcolinux-openbox-git
	arcolinux-openbox-themes-git
	arcolinux-obmenu-generator-minimal-git
	arcolinux-tint2-git
	arcolinux-tint2-themes-git
	arcolinux-nitrogen-git
	arcolinux-pipemenus-git
	arcolinux-common-git
	thunar
	thunar-archive-plugin
	thunar-volman
	xfce4-terminal
	arcolinux-xfce-git
	arcolinux-local-xfce4-git
)
install_list "${list[@]}"

list=(
	arcolinux-bin-git
	arcolinux-hblock-git
	arcolinux-root-git
	archlinux-tweak-tool-git
)
install_list "${list[@]}"
