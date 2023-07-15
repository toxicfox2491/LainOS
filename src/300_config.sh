#!/bin/bash

source functions.sh

# Mostly config files ##########################################################

category "Config files"

message 6 "Backup of $HOME/.config directory"
cp -Rf $HOME/.config $HOME/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
message 6 "Copying config files from ./LainOS-ricer-arch/etc/skel to /etc/skel"
sudo cp -arf ../etc/skel/. /etc/skel
message 6 "Copying all files and folders from /etc/skel to $HOME"
cp -arf /etc/skel/. $HOME
