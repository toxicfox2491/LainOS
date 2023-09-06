#!/usr/bin/env bash

source functions.sh

# Mostly config files ##########################################################

category "Global config files"

echo_p "Copying config files from ./LainOS-ricer-arch/etc/ to /etc/"
cp -r ../etc/* /etc

# Files used on LainOS #########################################################

category "Files for the system (/usr)"

echo_p "Copying LainOS files to /usr/share"
cp -r ../usr/* /usr

# Cursor theme by StarLabs
echo_p "Installing cursor theme"
unzip ../assets/icons/StarLabsMiddleFingerMod.zip -d /usr/share/icons

echo_p "Change name of the distro"
sed -i 's/NAME=.*/NAME=LainOS/' /etc/os-release
sed -i 's/PRETTY_NAME=.*/PRETTY_NAME=LainOS/' /etc/os-release
sed -i 's/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION=\"LainOS\"/' /etc/lsb-release

echo_p "Installing plymouth theme"
plymouth_hellonavi

# Creating a new user ##########################################################

category "Creating new user"

read -p "Enter the name of the new user: " user
useradd --create-home --groups sddm,video,wheel --shell /bin/zsh "$user"
echo_s "Now type your new password"
passwd "$user"

echo_p "Don't forget to add the new user to the wheel group!"
echo_s "Uncomment the line: %wheel ALL=(ALL) ALL"
read
EDITOR=nvim visudo

# Running the last script as the recently created user #########################

category "Script for user $user"

echo_p "Finish the installation as $user"
echo_s "Execute ./3_1_user.sh"

su $user

# All finished! ################################################################

category "Finished"

cat ../etc/skel/.config/neofetch/CoplandOS_clean

echo_p "Reboot the system"

echo_s "Read the AFTER-INSTALL.md file"
