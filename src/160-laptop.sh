#!/bin/bash

source functions.sh

###############################################################################
echo "Installation of laptop software"
###############################################################################

list=(
	tlp
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	install $name
done

###############################################################################

message 5 "Enabling services"

sudo systemctl enable tlp.service

message 11 "Software has been installed"
