#!/bin/bash

source functions.sh

###############################################################################
echo "Installation of samba software"
###############################################################################

list=(
	samba
	gvfs-smb
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	install $name
done

###############################################################################

message 5 "Getting the ArcoLinux Samba config"

sudo cp /etc/samba/smb.conf.arcolinux /etc/samba/smb.conf

message 5;echo "Give your username for samba"

read -p "What is your login? It will be used to add this user to smb : " choice
sudo smbpasswd -a $choice

message 5 "Enabling services"

sudo systemctl enable smb.service
sudo systemctl enable nmb.service

message 11 "Software has been installed"
