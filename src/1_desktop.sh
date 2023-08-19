#!/bin/bash

source functions.sh

# Preparation ##################################################################

cp ../etc/pacman.conf /etc/
cp -r ../etc/pacman.d/ /etc/

pacman -Syyu
pacman -S --noconfirm --needed pacman-contrib

# ArcoLinux keys
#Erik key
pacman-key --recv-keys 74F5DE85A506BF64
pacman-key --lsign-key 74F5DE85A506BF64

#Marco key
pacman-key --recv-keys F1ABB772CE9F7FC0
pacman-key --lsign-key F1ABB772CE9F7FC0

#John key
pacman-key --recv-keys 4B1B49F7186D8731
pacman-key --lsign-key 4B1B49F7186D8731

#Stephen key
pacman-key --recv-keys 02D507C6EFB8CEAA
pacman-key --lsign-key 02D507C6EFB8CEAA

#Brad Heffernan
pacman-key --recv-keys 18064BF445855549
pacman-key --lsign-key 18064BF445855549

#Raniel Laguna
pacman-key --recv-keys 7EC1A5550718AB89
pacman-key --lsign-key 7EC1A5550718AB89

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup >/etc/pacman.d/mirrorlist

# Desktop environment ##########################################################

message 6 "Installation of the core software"
list=(openbox plymouth sddm zsh)
install_list "${list[@]}"

echo_s "Enabling sddm as display manager"
systemctl enable sddm.service

# Sound ########################################################################

message 6 "Choose pulseaudio or pipewire to have sound"
echo_p "Make your choice:"
echo
echo_s "0.  Do nothing"
echo_s "1.  Pulseaudio"
echo_s "2.  Pipewire"
echo

list=()
read CHOICE
case $CHOICE in
0) echo_p "We did nothing as per your request\n" ;;
1) list=(pulseaudio pulseaudio-alsa pavucontrol
	alsa-firmware alsa-lib alsa-plugins alsa-utils
	gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base
	gst-plugins-ugly playerctl volumeicon) ;;
2) list=(pipewire pipewire-pulse pipewire-alsa
	pipewire-jack pipewire-zeroconf pavucontrol
	alsa-utils alsa-plugins alsa-lib alsa-firmware
	gstreamer gst-plugins-good gst-plugins-bad
	gst-plugins-base gst-plugins-volumeicon playerctl) ;;
*) echo_danger ">:v\n" ;;
esac
install_list "${list[@]}"

# Bluetooth ####################################################################

message 6 "Installation of bluetooth software"
list=(pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry)
install_list "${list[@]}"

echo_s "Enabling bluetooth service"

systemctl enable --now bluetooth.service
# sed -i 's/' #AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

# Printers #####################################################################

message 6 "Installation of printer software"
list=(cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends
	libcups system-config-printer)
install_list "${list[@]}"

echo_s "Enabling cups service"

systemctl enable --now cups.service

# Samba ########################################################################

message 6 "Installation of samba software"
list=(samba gvfs-smbn)
install_list "${list[@]}"

# echo_s "Give your username for samba"
#
#
# read -p "What is your login? It will be used to add this user to smb : " choice
# smbpasswd -a $choice

# echo_s "Enabling services"
#
# systemctl enable smb.service
# systemctl enable nmb.service

# Laptop #######################################################################

message 6 "Installation of laptop software"

list=(tlp)

echo -e "\n\n"
read -p "Is this device a laptop? [y/N] : " -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && install_list "${list[@]}" &&
	echo_s "Enabling services" && systemctl enable tlp.service &&
	echo_s "Software has been installed" ||
	echo_s "\nLaptop pRograms are not being installed"

# Network ######################################################################

message 6 "Installation of network software"

list=(avahi nss-mdns gvfs-smb)

install_list "${list[@]}"

echo_s "Enabling services"
systemctl enable avahi-daemon.service
