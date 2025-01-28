#!/usr/bin/env bash

# WARNING: DON'T JUST RUN. OBSERVE, JUDGE, AMUSE AT YOUR OWN PERIL.

source functions.sh

# Mostly config files ##########################################################

category "Global config files"

echo_p "Copying config files from ./LainOS/etc/ to /etc/"
cp -r ../etc/* /etc

echo_p "setting up grub theme"
#cp -r ../assets/grub/themes/LainOS /boot/grub/themes
#cp -an /etc/default/grub /etc/default/grub.bak
#sed -i '/GRUB_TIMEOUT_STYLE=/d' /etc/default/grub
#echo 'GRUB_TIMEOUT_STYLE="menu"' >>/etc/default/grub
#sed -i '/GRUB_TIMEOUT=/d' /etc/default/grub
#echo 'GRUB_TIMEOUT="13"' >>/etc/default/grub
#sed -i '/GRUB_GFXMODE=/d' /etc/default/grub
#echo 'GRUB_GFXMODE="auto"' >>/etc/default/grub

#I feel dumb- theres a function in the functions.sh file to apply the fucking theme! WHYYYYYY 
#I never knew this- I thought it was broken or something!
#no turns out you have to called it with "./LainOS-ricer-arch.sh -g"
#Im commenting out the function now concidering it'll apply automatically now
sed -i '/GRUB_THEME=/d' /etc/default/grub
echo GRUB_THEME="/boot/grub/lainOS/theme.txt" >> /etc/default/grub

/usr/bin/grub-mkconfig -o /boot/grub/grub.cfg

# Files used on LainOS #########################################################

category "Files for the system (/usr)"

echo_p "Copying config files from ./LainOS/usr/ to /usr/share"
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

# honestly I dont know why this wants you to create a new account.
# I get that this expects you to be on a fresh install
# but come on! if you setup a fresh install of arch I'd assume you'd do the bare minimum
# of setting up a user already

category "Creating new user"
read -rp "Enter the name of your user account: " user
# useradd --create-home --groups sddm,video,wheel --shell /bin/zsh "$user"
# echo_s "Now type your new password"
# passwd "$user"

# echo_p "Don't forget to add the new user to the wheel group!"
# echo_s "Uncomment the line: %wheel ALL=(ALL) ALL"
# read -r
# EDITOR=nano

# Running the last script as the recently created user #########################

category "Script for user $user"

echo_p "Finish the installation as $user"
echo_s "Execute ./3_1_user.sh"

su "$user"

# All finished! ################################################################

category "Finished"

cat ../etc/skel/.config/neofetch/CoplandOS_clean

echo_p "Reboot the system"

echo_s "Read the AFTER-INSTALL.md file"
