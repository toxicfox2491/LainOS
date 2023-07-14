#!/bin/bash

source functions.sh

echo "Installation of laptop software"

list=(
	tlp
)

echo -e "\n\n"
read -p "Is this device a laptop? [y/N] : " -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && install_list "${list[@]}" && message 5 "Enabling services" && sudo systemctl enable tlp.service && message 11 "Software has been installed" || echo -e "\nPrograms are not being installed"
