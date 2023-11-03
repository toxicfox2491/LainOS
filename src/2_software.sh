#!/usr/bin/env bash

# CAUTION: DON'T JUST RUN. OBSERVE, JUDGE, AMUSE AT YOUR OWN PERIL.

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
	archiso base-devel ctags curl entr gdb git git-delta jq lazygit make
	man-pages meld neovim nix onefetch python-virtualenv python-pipx
	shellcheck valgrind wget)
install_list "${list[@]}"

category Programming
list=(clang clisp gcc go python rust)
install_list "${list[@]}"

category Fonts
list=(gnome-font-viewer otf-cascadia-code ttc-iosevka ttf-agave ttf-droid
	ttf-fira-code ttf-hack ttf-inconsolata)
install_list "${list[@]}"

category Games
list=( #0ad steam
	supertux supertuxkart)
install_list "${list[@]}"

category Graphics
list=( #scour
	gimp inkscape loupe)
install_list "${list[@]}"

category Hacking
# kloak & zenmap on 3_1_user.sh script
list=(bettercap nmap sqlmap wireshark-qt kismet wifite metasploit hashcat)
install_list "${list[@]}"

category Internet
list=( #deluge deluge-gtk
	firefox thunderbird)
install_list "${list[@]}"

category Multimedia
list=(cheese lollypop mpv vlc)
install_list "${list[@]}"

category Office
list=(evince libreoffice-fresh)
install_list "${list[@]}"

category Privacy/Security
# Librewolf and Tor on 3_1_user.sh script
list=(element-desktop firejail gufw gpa hblock keepassxc macchanger)
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
	lxappearance lxappearance-obconf lxrandr nitrogen nix obconf obmenu-generator
	perl-linux-desktopfiles picom playerctl rofi rofi-calc tint2
	variety volumeicon xorg-xbacklight xorg-xkill xorg-xrdb)
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
