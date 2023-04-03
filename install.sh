#!/bin/bash
DIR=$HOME/.config/dwm
CONFIG_DIR=$HOME/.config
bold=$(tput bold)
normal=$(tput sgr0)

clear


#Dependencies
echo -e "\e[1;31m${bold}Installing dependencies${normal}\e[0m"
yay -Syu --noconfirm 'lxappearance' 'rofi' 'dunst' 'alsa-utils' 'feh'  'bluez' 'ntfs-3g' 'arandr' 'gruvbox-dark-gtk'\
  'sddm' 'mcfly' 'stow'\
  'zathura' 'zathura-pdf-mupdf' 'ninja' 'lf'\
  'neovim' 'apple-fonts' 'libconfig' 'spotify'\
  'qt5-styleplugins' 'cmake' 'bluez-utils'\
  'rustup' 'python' 'python-pip' 'zsh' \
  'playerctl' 'pamixer' 'spicetify-cli' \
  'microsoft-edge-dev-bin' 'alacritty' 'visual-studio-code-bin' 'parcellite'\
  'postman-bin' 'flameshot' 'spotify' 'fzf' 'exa' 'zoxide' --needed

echo -e "DONE with yay install"
sudo pacman -S --noconfirm 'qt5' 'gstreamer' 'gst-libav' 'gst-plugins-good' --needed
sudo systemctl enable sddm.service

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


BACK_PID=$!
wait $BACK_PID
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


