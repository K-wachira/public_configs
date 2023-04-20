#!/bin/bash
DIR=$HOME/.config/dwm
CONFIG_DIR=$HOME/.config
bold=$(tput bold)
normal=$(tput sgr0)

clear

#### Check for yay ####
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "$COK - yay was located, moving on."
else 
    echo -e "$CWR - Yay was NOT located"
    read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to install yay (y,n) ' INSTYAY
    if [[ $INSTYAY == "Y" || $INSTYAY == "y" ]]; then
        git clone https://aur.archlinux.org/yay-git.git &>> $INSTLOG
        cd yay-git
        makepkg -si --noconfirm &>> ../$INSTLOG
        cd ..
        
    else
        echo -e "$CER - Yay is required for this script, now exiting"
        exit
    fi
fi

#Dependencies
echo -e "\e[1;31m${bold}Installing dependencies${normal}\e[0m"
yay -Syu --noconfirm 'lxappearance' 'dunst' 'alsa-utils' 'feh'  'bluez' 'ntfs-3g' 'arandr' 'gruvbox-dark-gtk' \
  'sddm-git' 'stow' \
  'ninja' 'lf' \
  'neovim' 'apple-fonts' 'libconfig' 'spotify' \
  'qt5-styleplugins' 'cmake' 'bluez-utils' \
  'python' 'python-pip' 'zsh' \
  'playerctl' 'pamixer' 'spicetify-cli' \
  'microsoft-edge-dev-bin' 'alacritty' \
  'postman-bin' 'flameshot' 'spotify' 'fzf' 'exa' 'zoxide' 'cliphist' 'wofi' 'mpv' 'clang'\
  'fd' 'ripgrep' 'stylua' --needed

echo -e "DONE with yay installs"
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

