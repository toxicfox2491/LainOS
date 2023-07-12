#!/bin/bash

source functions.sh

category Conky

list=(
	conky-lua-archers
	arcolinux-conky-collection-git
	arcolinux-pipemenus-git
	# yad
	libpulse
)

install_list "${list[@]}"

message 11 "Software has been installed"
