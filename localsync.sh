#!/bin/bash
DIR=$HOME/.config/dwm
CONFIG_DIR=$HOME/.config
bold=$(tput bold)
normal=$(tput sgr0)

clear

# Copy dwm for backup
echo -e "\e[1;31m${bold}Copying dwm to .kelvin-configs ... ${normal}\e[0m"
cp -r $CONFIG_DIR/dwm/* ./dwm
echo -e "\e[1;31m${bold}Done copying dwm to .kelvin-configs${normal}\e[0m"

# Copy zshrc
echo -e "\e[1;31m${bold}copying .zshrc ${normal}\e[0m"
cp $HOME/.zshrc .zshrc
echo -e "\e[1;31m${bold}Done copying .zshrc ${normal}\e[0m"

#
