#!/bin/bash

source functions.sh

# Mostly config files ##########################################################

category "Config files"

message 6 "Copying config files from ./LainOS-ricer-arch/etc/ to /etc/"
cp -r ../etc/* /etc

# More settings ################################################################

# # For urxvt
# xrdb -load ~/.Xresources

# TODO: fonts

# mkdir -p $HOME/Pictures/Screenshots

# Cursor theme by StarLabs
unzip ../assets/icons/StarLabsMiddleFingerMod.zip -d /usr/share/icons

plymouth_hellonavi

read -p "Enter the name of the new user: " user
useradd --create-home --shell /bin/zsh "$user"
echo "Now type your new password"
passwd "$user"
