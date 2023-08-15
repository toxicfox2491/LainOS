#!/bin/bash

source functions.sh

# Mostly config files ##########################################################

category "Config files"

message 6 "Copying config files from ./LainOS-ricer-arch/etc/ to /etc/"
cp -r ../etc/* /etc

# Files used on LainOS #########################################################

category "LainOS files"

message 6 "Copying LainOS files to /usr/share"
cp -r ../assets/LainOS /usr/share/

# More settings ################################################################

# TODO: fonts

# Cursor theme by StarLabs
message 6 "Installing cursor theme"
unzip ../assets/icons/StarLabsMiddleFingerMod.zip -d /usr/share/icons

message 6 "Installing plymouth theme"
plymouth_hellonavi

# Creating a new user ##########################################################

category "Creating new user"

read -p "Enter the name of the new user: " user
useradd --create-home --groups sddm,wheel --shell /bin/zsh "$user"
echo "Now type your new password"
passwd "$user"

echo "Don't forget to add the new user to the wheel group! Run:"
echo -e "\tEDITOR=nvim visudo"
echo "Uncomment this line:"
echo -e "\t %wheel ALL=(ALL) ALL"
