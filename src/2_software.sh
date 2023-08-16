#!/bin/bash

source functions.sh

# Base #########################################################################

category Accessories
list=( #universal-android-debloater-bin onthespot-git spicetify-cli
	#dialect
	chafa xdg-user-dirs zsh
)
install_list "${list[@]}"

category Development
list=( #gnome-boxes
	base-devel ctags curl entr gcc gdb git git-delta jq lazygit make meld
	neovim onefetch python-virtualenv scrot shellcheck valgrind wget)
install_list "${list[@]}"

category Games
list=( #0ad steam
	supertux supertuxkart)
install_list "${list[@]}"

category Graphics
list=( #gimp inkscape
	nsxiv)
install_list "${list[@]}"

category Internet
list=(deluge deluge-gtk firefox)
install_list "${list[@]}"

category Multimedia
list=(mpv)
install_list "${list[@]}"

category Office
list=(evince)
install_list "${list[@]}"

category Privacy
list=(element-desktop hblock keepassxc)
install_list "${list[@]}"

category System
list=(dconf-editor arc-gtk-theme openbox-arc-git inxi)
install_list "${list[@]}"

category Terminal
list=(alacritty asciinema asciiquarium bat broot btop cmatrix
	duf dust exa fd ffmpeg figlet fzf htop neofetch perl-image-exiftool
	procs python-pywal rclone ripgrep rxvt-unicode sl sqlite tldr
	terminus-font tmux vnstat xdg-ninja xsel yt-dlp zoxide)
install_list "${list[@]}"

category Unpack
list=(unace unrar zip unzip sharutils uudeview arj cabextract file-roller)
install_list "${list[@]}"

category Utilities
list=(arandr gmrun gtk2-perl gtk-engine-murrine imagemagick lxappearance-obconf
	lxrandr nitrogen obconf obmenu3 obmenu-generator perl-linux-desktopfiles
	picom playerctl rofi tint2 volumeicon w3m xorg-xbacklight xorg-xkill)
install_list "${list[@]}"

# ArcoLinux ####################################################################

category ArcoLinux

list=(
	xfce4-appfinder
	xfce4-clipman-plugin
	xfce4-power-manager
	xfce4-screenshooter
	xfce4-settings
	xfce4-taskmanager
	thunar
	thunar-archive-plugin
	thunar-volman
	arcolinux-openbox-themes-git
	arcolinux-tint2-themes-git
	arcolinux-pipemenus-git
	arcolinux-common-git
	arcolinux-xfce-git
	arcolinux-local-xfce4-git
	arcolinux-bin-git
	archlinux-logout-git
	archlinux-tweak-tool-git
)
install_list "${list[@]}"
