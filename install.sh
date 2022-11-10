#!/bin/bash
DIR=$HOME/.config/dwm
CONFIG_DIR=$HOME/.config
bold=$(tput bold)
normal=$(tput sgr0)

clear


#Dependencies
echo -e "\e[1;31m${bold}Installing dependencies${normal}\e[0m"
yay -Syu --noconfirm 'sxhkd' 'rofi' 'dunst' 'alsa-utils' 
  'maim' 'xclip' 'viewnior' 'feh' 'gd' 'bluez' 'trash-cli'\
  'ksuperkey' 'betterlockscreen' 'xfce-polkit' 'xfce4-power-manager' 'brightnessctl'\
  'xsettingsd' 'xorg-xsetroot' 'wmname' 'wpgtk' 'meson'\
  'zathura' 'zathura-pdf-mupdf' 'bpytop' 'ninja'\
  'neovim' 'apple-fonts' 'libconfig' 'spotify'\
  'qt5-styleplugins' 'lutris' 'discord' 'cmake' 'libev' 'uthash' 'bluez-utils'\
  'betterdiscordctl' 'dash' 'eww' 'networkmanager-dmenu-git' 'xorg'\
  'base-devel' 'rustup' 'python' 'python-pip' 'lf' 'archivemount-git'\
  'gobject-introspection' 'imagemagick' 'zsh' 'jq' 'poetry' 'xdo'\
  'mpd' 'mpc' 'playerctl' 'pamixer' 'redshift' 'spicetify-cli' \
  'microsoft-edge-dev-bin' 'alacritty' 'visual-studio-code-bin' 'parcellite'\
  'postman-bin' 'flameshot' 'spotify' --needed
pip install utils material_color_utilities_python
BACK_PID=$!
wait $BACK_PID
clear


cd $HOME

#Picom
echo -e "\e[1;31m${bold}Installing Picom${normal}\e[0m"
git clone https://github.com/FT-Labs/picom
cd picom
meson --buildtype=release . build
sudo ninja -C build install
cd ..
rm -rf picom
clear



#Zathura
echo -e "\e[1;31m${bold}Installing zathura-pywal${normal}\e[0m"
git clone https://github.com/mlscarlson/zathura-pywal/
cd zathura-pywal
sudo make install
cd ..
rm -rf zathura-pywal
clear


#NvChad installation
echo -e "\e[1;31m${bold}Installing nvchad${normal}\e[0m"
git clone https://github.com/NvChad/NvChad $CONFIG_DIR/nvim --depth 1
ln -sf $HOME/.dotfiles_new/files/nvchad/custom $CONFIG_DIR/nvim/lua/
clear

#Spicetify
echo -e "\e[1;31m${bold}Configuring spicetify${normal}\e[0m"
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify backup apply enable-devtools
ln -sf $DIR/spicetify/ziro $CONFIG_DIR/spicetify/Themes/
spicetify config current_theme ziro
spicetify apply
clear

#Shell
echo -e "\e[1;31m${bold}Changing shell${normal}\e[0m"
chsh -s $(which zsh)
BACK_PID=$!
wait $BACK_PID
clear

