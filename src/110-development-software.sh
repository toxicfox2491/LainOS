#!/bin/bash

source functions.sh

###############################################################################
echo "Installation of the development packages"
###############################################################################

list=(
	#firefox
	#flameshot
	meld
	#the_platinum_searcher-bin
	telegram-desktop
	#simplescreenrecorder
	scrot
)

count=0

for name in "${list[@]}"; do
	count=$((count + 1))
	tput setaf 3
	echo "Installing package nr.  "$count " " $name
	tput sgr0
	install $name
done

###############################################################################

message 11 "Software has been installed"
