#!/bin/bash

source functions.sh

message 7 "Installation of samba software"

list=(
	samba
	gvfs-smb
)

install_list "${list[@]}"

message 5 "Getting the ArcoLinux Samba config"

sudo cp /etc/samba/smb.conf.arcolinux /etc/samba/smb.conf

message 5
echo "Give your username for samba"

read -p "What is your login? It will be used to add this user to smb : " choice
sudo smbpasswd -a $choice

message 5 "Enabling services"

sudo systemctl enable smb.service
sudo systemctl enable nmb.service

message 11 "Software has been installed"
