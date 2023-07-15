#!/bin/bash

source functions.sh

# Base #########################################################################

category Accessories
list=()
install_list "${list[@]}"

category Development
list=(ctags curl gcc gdb git git-delta jq lazygit make meld
	neovim onefetch python3-venv scrot shellcheck valgrind wget)
install_list "${list[@]}"

category Games
list=( #0ad
	supertux supertuxkart)
install_list "${list[@]}"

category Graphics
list=( #gimp inkscape
	nsxiv)
install_list "${list[@]}"

category Internet
list=(deluge)
install_list "${list[@]}"

category Multimedia
list=(mpv)
install_list "${list[@]}"

category Office
list=(evince)
install_list "${list[@]}"

category Privacy
list=(hblock keepassxc tor-browser)
install_list "${list[@]}"

category System
list=(dconf-editor arc-gtk-theme openbox-arc-git inxi)
install_list "${list[@]}"

category Terminal
list=(alacritty asciinema asciiquarium bat broot btop c-lolcat cmatrix
	duf dust exiftool fd ffmpeg figlet htop lsd neofetch onefetch
	procs python-pywal rclone ripgrep rxvt-unicode sl sqlite tldr
	tmux vnstat xdg-ninja xsel yt-dlp)
install_list "${list[@]}"

category Unpack
list=(unace unrar zip unzip sharutils uudeview arj cabextract file-roller)
install_list "${list[@]}"

category Utilities
list=(arandr gmrun gtk2-perl gtk-engine-murrine imagemagick lxappearance-obconf
	lxrandr nitrogen obconf obmenu3 obmenu-generator perl-linux-desktopfiles
	picom playerctl tint2 volumeicon w3m)
install_list "${list[@]}"

# ArcoLinux ####################################################################

category ArcoLinux

list=(
	xfce4-appfinder
	xfce4-power-manager
	xfce4-screenshooter
	xfce4-settings
	xfce4-taskmanager
	thunar
	thunar-archive-plugin
	thunar-volman
	arcolinux-openbox-git
	arcolinux-openbox-themes-git
	arcolinux-tint2-themes-git
	arcolinux-pipemenus-git
	arcolinux-common-git
	arcolinux-xfce-git
	arcolinux-local-xfce4-git
	arcolinux-bin-git
	archlinux-tweak-tool-git
)
install_list "${list[@]}"
