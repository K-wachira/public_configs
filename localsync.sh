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

# Copy fonts for backup
echo -e "\e[1;31m${bold}Copying .fonts to .kelvin-configs ... ${normal}\e[0m"
cp $HOME/.fonts/* ./.fonts
echo -e "\e[1;31m${bold}Done copying fonts to .kelvin-configs${normal}\e[0m"

# alacritty
echo -e "\e[1;31m${bold}copying alacritty to .kelvin-configs${normal}\e[0m"
cp -r $CONFIG_DIR/alacritty ./alacritty
echo -e "\e[1;31m${bold}Done copying alacritty to .kelvin-configs${normal}\e[0m"


# st 
echo -e "\e[1;31m${bold}copying simple terminal to .kelvin-configs${normal}\e[0m"
cp -r $CONFIG_DIR/best ./st
echo -e "\e[1;31m${bold}Done copying st to .kelvin-configs${normal}\e[0m"

#  nvim 
echo -e "\e[1;31m${bold}copying nvim to .kelvin-configs${normal}\e[0m"
cp -r $CONFIG_DIR/nvim/* ./nvim
echo -e "\e[1;31m${bold}Done copying nvim to .kelvin-configs${normal}\e[0m"

#  slstatus 
echo -e "\e[1;31m${bold}copying slstatus to .kelvin-configs${normal}\e[0m"
cp -r $CONFIG_DIR/slstatus/* ./slstatus
echo -e "\e[1;31m${bold}Done copying slstatus to .kelvin-configs${normal}\e[0m"

# zathura 
echo -e "\e[1;31m${bold}copying zathura to .kelvin-configs${normal}\e[0m"
cp -r $CONFIG_DIR/zathura/* ./zathura
echo -e "\e[1;31m${bold}Done copying zathura to .kelvin-configs${normal}\e[0m"
