#!/bin/bash

source functions.sh

message 7 "Installation of bluetooth software"

list=(
	pulseaudio-bluetooth
	bluez
	bluez-libs
	bluez-utils
	blueberry
)

install_list "${list[@]}"

message 5 "Enabling services"

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/' #AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

message 11 "Software has been installed"
