#!/bin/bash

source functions.sh

category Accessories

list=(mintstick-git)

install_list "${list[@]}"

category Multimedia

list=(peek)

install_list "${list[@]}"

category System

list=(inxi)

install_list "${list[@]}"

message 11 "Software has been installed"
