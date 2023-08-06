#!/bin/bash

# ---------------------------------------------------------------------------
#
# Script to automate (as much as possible) LainOS ricing starting from a
# fresh install of Arch Linux.
#
# The idea is to run this script just after making your Arch install.
#
# Read the scripts before running them.
#
# Created by hasecilu & LainOS team
# 		based on ArcoLinuxD-openbox scripts by Erik Dubois
#
# NAME: LainOS ricer 4 Arch,  Part 1: root user
# VERSION: 0.3
#
# ---------------------------------------------------------------------------

if [ "${PWD##*/}" != "src" ]; then
	function echo_error() { echo -ne "\033[0;1;31merror:\033[0;31m\t${*}\033[0m\n"; }
	echo_error "The working directory must be 'src'."
	exit 1
else
	if [ "$EUID" -ne 0 ]; then
		echo "Please run as root."
		echo
		exit
	else
		source functions.sh
		if [ $# -eq 0 ]; then
			./1_desktop.sh
			./2_software.sh
			./3_config.sh
		else
			help
		fi
	fi
fi
