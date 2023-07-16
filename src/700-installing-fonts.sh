#!/bin/bash

source functions.sh

list=(
	arcolinux-fonts-git
	awesome-terminal-fonts
	adobe-source-sans-fonts
	cantarell-fonts
	noto-fonts
	ttf-bitstream-vera
	ttf-dejavu
	ttf-droid
	ttf-hack
	ttf-inconsolata
	ttf-liberation
	ttf-roboto
	ttf-ubuntu-font-family
	tamsyn-font
)

install_list "${list[@]}"

message 11 "Software has been installed"
