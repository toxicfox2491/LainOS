#!/bin/bash

source functions.sh

message 7 "Installation of the development packages"

list=(
	#firefox
	#flameshot
	meld
	#the_platinum_searcher-bin
	telegram-desktop
	#simplescreenrecorder
	scrot
)

install_list "${list[@]}"

count=0

message 11 "Software has been installed"
