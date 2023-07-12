#!/bin/bash

source functions.sh

###############################################################################

category Accessories

list=(
	variety
)

install_list "${list[@]}"

category Development

list=(
	#atom
	#meld
	#sublime-text-4
)

install_list "${list[@]}"

category Graphics

list=(
	#gimp
	inkscape
	#nomacs
)

install_list "${list[@]}"

category Internet

list=(
	#chromium
	#qbittorrent
	deluge
)

install_list "${list[@]}"

category Multimedia

list=(
	mpv
)

install_list "${list[@]}"

category Office

list=(
	evince
)

install_list "${list[@]}"

category System

list=(
	dconf-editor
	arc-gtk-theme
	openbox-arc-git
)

install_list "${list[@]}"

category Unpack

list=(
	unace
	unrar
	zip
	unzip
	sharutils
	uudeview
	arj
	cabextract
	file-roller
)

install_list "${list[@]}"

message 11 "Software has been installed"
