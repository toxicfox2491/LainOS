#!/bin/bash

source functions.sh

function pulseaudio() {
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

	install_list "${list[@]}"

	message 11 "Software has been installed"
}

function pipewire() {
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

	install_list "${list[@]}"

	message 11 "Software has been installed"
}

message 7 "Choose pulseaudio or pipewire to have sound"
echo
echo "Select the correct number"
echo
echo "0.  Do nothing"
echo "1.  Pulseaudio"
echo "2.  Pipewire"
echo "Type the number..."

read CHOICE

case $CHOICE in

0)
	echo
	echo "########################################"
	echo "We did nothing as per your request"
	echo "########################################"
	echo
	;;

1)
	pulseaudio
	;;
2)
	pipewire
	;;
*)
	echo "#################################"
	echo "Choose the correct number"
	echo "#################################"
	;;
esac
