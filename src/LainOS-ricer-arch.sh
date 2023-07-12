#!/bin/bash

# ---------------------------------------------------------------------------
#
# Script to automate (as much as possible) LainOS ricing starting from a
# fresh install of Arch Linux
#
# Created by hasecilu & LainOS team
# 		based on ArcoLinuxD-openbox scripts by Erik Dubois
#
# ---------------------------------------------------------------------------

NAME="LainOS ricer Arch flavor"
VERSION="0.1"

if [ "${PWD##*/}" != "src" ]; then
	function echo_error() { echo -ne "\033[0;1;31merror:\033[0;31m\t${*}\033[0m\n"; }
	echo_error "The working directory must be 'src'."
	exit 1
else
	source functions.sh
	if [ $# -eq 0 ]; then
		main
	else
		help
	fi
fi
