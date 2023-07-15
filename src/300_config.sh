#!/bin/bash

source functions.sh

# Mostly config files ##########################################################

message 6 "Copying all files and folders from /etc/skel to ~"
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
cp -arf /etc/skel/. ~

category Accessories
list=(variety mintstick-git)
install_list "${list[@]}"
