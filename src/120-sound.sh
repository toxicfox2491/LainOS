#!/bin/bash

source functions.sh

function_pulseaudio() {
	list=(
		pulseaudio
		pulseaudio-alsa
		pavucontrol
		alsa-firmware
		alsa-lib
		alsa-plugins
		alsa-utils
		gstreamer
		gst-plugins-good
		gst-plugins-bad
		gst-plugins-base
		gst-plugins-ugly
		playerctl
		volumeicon
	)

	count=0

	for name in "${list[@]}" ; do
		count=$[count+1]
		tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
		install $name
	done

	###############################################################################

	message 11 "Software has been installed"
}

function_pipewire() {
	list=(
	pipewire
	pipewire-pulse
	pipewire-alsa
	pipewire-jack
	pipewire-zeroconf
	pavucontrol
	alsa-utils
	alsa-plugins
	alsa-lib
	alsa-firmware
	gstreamer
	gst-plugins-good
	gst-plugins-bad
	gst-plugins-base
	gst-plugins-ugly   
	volumeicon
	playerctl
	)

	count=0

	for name in "${list[@]}" ; do
		count=$[count+1]
		tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
		install $name
	done

	###############################################################################

	message 11 "Software has been installed"
}

echo
tput setaf 2
echo "################################################################"
echo "#####  Choose pulseaudio or pipewire to have sound          ####"
echo "################################################################"
tput sgr0
echo
echo "Select the correct number"
echo
echo "0.  Do nothing"
echo "1.  Pulseaudio"
echo "2.  Pipewire"
echo "Type the number..."

read CHOICE

case $CHOICE in

    0 )
		echo
		echo "########################################"
		echo "We did nothing as per your request"
		echo "########################################"
		echo
		;;

    1 )
		function_pulseaudio 
      	;;
    2 )
		function_pipewire
		;;
    * )
		echo "#################################"
		echo "Choose the correct number"
		echo "#################################"
		;;
esac
