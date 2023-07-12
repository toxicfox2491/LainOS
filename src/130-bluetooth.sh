#!/bin/bash

source functions.sh

###############################################################################
echo "Installation of bluetooth software"
###############################################################################

list=(
	pulseaudio-bluetooth
	bluez
	bluez-libs
	bluez-utils
	blueberry
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	install $name
done

###############################################################################

message 5 "Enabling services"

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

message 11 "Software has been installed"
