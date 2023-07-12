#!/bin/bash

source functions.sh

category Arcolinux-Desktop

list=(
	arcolinux-openbox-git
	# arcolinux-config-all-desktops-git
	# arcolinux-dconf-all-desktops-git
	arcolinux-openbox-themes-git
	arcolinux-obmenu-generator-minimal-git
	arcolinux-tint2-git
	arcolinux-tint2-themes-git
	arcolinux-nitrogen-git
	arcolinux-pipemenus-git
	arcolinux-common-git
	# yad
	thunar
	thunar-archive-plugin
	thunar-volman
	xfce4-terminal
	arcolinux-xfce-git
	arcolinux-local-xfce4-git
)

install_list "${list[@]}"

category Arcolinux-General

list=(
	arcolinux-bin-git
	arcolinux-hblock-git
	arcolinux-root-git
	arcolinux-termite-themes-git
	archlinux-tweak-tool-git
	arcolinux-variety-git
)

install_list "${list[@]}"

message 11 "Software has been installed"
