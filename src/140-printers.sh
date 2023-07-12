#!/bin/bash

source functions.sh

###############################################################################
echo "Installation of printer software"
###############################################################################

list=(
	cups
	cups-pdf
	ghostscript
	gsfonts
	gutenprint
	gtk3-print-backends
	libcups
	system-config-printer
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	install $name
done

###############################################################################

message 5 "Enabling services"

sudo systemctl enable --now cups.service

message 11 "Software has been installed"
