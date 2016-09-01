#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh
source $dotfiles/lib/utils

if [ "$OS" != "linux" ]; then
  exit 0
fi

## IMPORTANT
## Gnome 3.20 may not work depending on the Video driver
# gnome_version=$(type_exists "gnome-shell" && gnome-shell --version)
# if [[ $gnome_version != *"3.20"* ]] ; then
#   sudo add-apt-repository ppa:gnome3-team/gnome3-staging
#   sudo add-apt-repository ppa:gnome3-team/gnome3
#   sudo apt update
#   sudo apt dist-upgrade
#   sudo apt install gnome gnome-shell -y
# fi

mkdir ~/.themes

if [[ $gnome_version == *"3.20"* ]] ; then
  FLATPLAT_URL="https://github.com/nana-4/Flat-Plat/releases/download/v3.20.20160821/Flat-Plat-3.20.20160821.tar.gz"
elif [[ $gnome_version == *"3.18"* ]] ; then
  FLATPLAT_URL="https://github.com/nana-4/Flat-Plat/releases/download/v3.18.20160821/Flat-Plat-3.18.20160821.tar.gz"
else
  echo "Not suported Gnome version: $gnome_version"
  exit 1
fi

# Flat Plat GTK
curl -L $FLATPLAT_URL | tar zx -C ~/.themes/

# GDM (Lock/Login Screen)
# https://github.com/nana-4/Flat-Plat#gdm-locklogin-screen
sudo cp -i /usr/share/gnome-shell/gnome-shell-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource~
sudo cp -div ~/.themes/Flat-Plat/gnome-shell/gnome-shell-theme.gresource /usr/share/gnome-shell

# Paper Icons
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install -y paper-icon-theme

# Install Gnome Shell integration for Chrome
sudo add-apt-repository ppa:ne0sight/chrome-gnome-shell
sudo apt-get update
sudo apt-get install chrome-gnome-shell

bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh | sed 's/282c34/262626/g')"
gconftool-2 --set /apps/gnome-terminal/global/default_profile --type string one-dark


# Terminal font
mkdir ~/.fonts
wget -P ~/.fonts 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete.ttf'
