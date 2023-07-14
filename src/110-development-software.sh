#!/bin/bash

source functions.sh

message 7 "Installation of the development packages"

list=(
	ctags
	gcc
	gdb
	git
	git-delta
	jq
	lazygit
	meld
	neovim
	onefetch
	scrot
	shellcheck
	valgrind
)

install_list "${list[@]}"

count=0

message 11 "Software has been installed"
