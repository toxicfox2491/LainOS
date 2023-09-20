#!/usr/bin/env bash

source functions.sh

# Base #########################################################################

category Accessories
list=( #universal-android-debloater-bin onthespot-git spicetify-cli
	#dialect
	chafa ffmpeg perl-image-exiftool rclone rsync scrot sqlite
	xdg-ninja xdg-user-dirs yt-dlp)
install_list "${list[@]}"

category Development
list=( #gnome-boxes
	base-devel ctags curl entr gcc gdb git git-delta jq lazygit make
	man-pages meld neovim onefetch python-virtualenv python-pipx
	shellcheck valgrind wget)
install_list "${list[@]}"

category Fonts
list=(otf-cascadia-code ttc-iosevka ttf-agave ttf-droid ttf-fira-code ttf-hack
	ttf-inconsolata)
install_list "${list[@]}"

category Games
list=( #0ad steam
	supertux supertuxkart)
install_list "${list[@]}"

category Graphics
list=( #gimp inkscape scour
	eog)
install_list "${list[@]}"

category Internet
list=( #deluge deluge-gtk
	firefox thunderbird)
install_list "${list[@]}"

category Multimedia
list=(cheese mpv)
install_list "${list[@]}"

category Office
list=( #libreoffice-fresh
	evince)
install_list "${list[@]}"

category Privacy
# Librewolf and Tor on 3_1_user.sh script
list=(element-desktop hblock keepassxc)
install_list "${list[@]}"

category System
list=(dconf-editor arc-gtk-theme openbox-arc-git inxi)
install_list "${list[@]}"

category Terminal
list=(alacritty asciinema bat broot btop duf dust eza fd fzf htop
	man-db neofetch procs python-pywal ripgrep rxvt-unicode tldr
	terminus-font tmux vnstat xsel zoxide)
install_list "${list[@]}"
systemctl enable --now vnstat

category Terminal games
list=(asciiquarium cmatrix cowsay figlet sl)
install_list "${list[@]}"

category Themes
list=(breeze breeze-gtk)
install_list "${list[@]}"

category Unpack
list=(unace unrar zip unzip sharutils uudeview arj cabextract file-roller p7zip)
install_list "${list[@]}"

category Utilities
list=(arandr baobab gmrun gsimplecal gtk2-perl gtk-engine-murrine imagemagick
	lxappearance lxappearance-obconf lxrandr nitrogen obconf obmenu-generator
	perl-linux-desktopfiles picom playerctl rofi rofi-calc tint2
	volumeicon xorg-xbacklight xorg-xkill xorg-xrdb)
install_list "${list[@]}"

# ArcoLinux ####################################################################

category ArcoLinux

list=(
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
)
install_list "${list[@]}"
