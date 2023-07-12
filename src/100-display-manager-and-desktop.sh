#!/bin/bash

source functions.sh

list=(sddm openbox)

echo -e "\nInstallation of the core software\n"

install_list "${list[@]}"

message 6 "Copying all files and folders from /etc/skel to ~"
echo copy files
echo copy other files
# cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
# cp -arf /etc/skel/. ~

message 5 "Enabling sddm as display manager"
echo activate service
# sudo systemctl enable sddm.service -f

message 7 "You now have a very minimal functional desktop"

message 11 "Reboot your system"
