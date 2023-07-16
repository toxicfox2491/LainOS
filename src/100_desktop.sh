#!/bin/bash

source functions.sh

# Desktop environment ##########################################################

message 7 "Installation of the core software"
list=(sddm openbox)
install_list "${list[@]}"

message 5 "Enabling sddm as display manager"
sudo systemctl enable sddm.service -f

# Sound ########################################################################

message 7 "Choose pulseaudio or pipewire to have sound"
echo "Make your choice:"
echo
echo "0.  Do nothing"
echo "1.  Pulseaudio"
echo "2.  Pipewire"
echo

read CHOICE

case $CHOICE in
0) echo -e "We did nothing as per your request\n" ;;
1) pulseaudio ;;
2) pipewire ;;
*) echo -e "Choose the correct number\n" ;;
esac

# Bluetooth ####################################################################

message 7 "Installation of bluetooth software"
list=(pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry)
install_list "${list[@]}"

message 5 "Enabling bluetooth service"

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/' #AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

# Printers #####################################################################

message 7 "Installation of printer software"
list=(cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends
	libcups system-config-printer)
install_list "${list[@]}"

message 5 "Enabling cups service"

sudo systemctl enable --now cups.service

# Samba ########################################################################

message 7 "Installation of samba software"
list=(samba gvfs-smb)
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

# Laptop #######################################################################

echo "Installation of laptop software"

list=(tlp)

echo -e "\n\n"
read -p "Is this device a laptop? [y/N] : " -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && install_list "${list[@]}" &&
	message 5 "Enabling services" && sudo systemctl enable tlp.service &&
	message 11 "Software has been installed" ||
	echo -e "\nPrograms are not being installed"

# Network ######################################################################

message 7 "Installation of network software"

list=(avahi nss-mdns gvfs-smb)

install_list "${list[@]}"

tput setaf 5
echo "################################################################"
echo "Change /etc/nsswitch.conf for access to nas servers"
echo "We assume you are on ArcoLinux and have"
echo "arcolinux-system-config-git or arcolinuxd-system-config-git"
echo "installed. Else check and change the content of this file to your liking"
echo "################################################################"
echo
tput sgr0

# https://wiki.archlinux.org/title/Domain_name_resolution
if [ -f /usr/local/share/arcolinux/nsswitch.conf ]; then
	echo "Make backup and copy the ArcoLinux nsswitch.conf to /etc/nsswitch.conf"
	echo
	sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
	sudo cp /usr/local/share/arcolinux/nsswitch.conf /etc/nsswitch.conf
else
	echo "Getting latest /etc/nsswitch.conf from the internet"
	sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
	sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf
fi

message 5 "Enabling services"
sudo systemctl enable avahi-daemon.service
