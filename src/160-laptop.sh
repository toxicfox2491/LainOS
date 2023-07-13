#!/bin/bash

source functions.sh

echo "Installation of laptop software"

list=(
	tlp
)

install_list "${list[@]}"

message 5 "Enabling services"

sudo systemctl enable tlp.service

message 11 "Software has been installed"
