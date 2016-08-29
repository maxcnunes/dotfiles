#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh
source $dotfiles/lib/utils

if [ "$OS" != "linux" ]; then
  exit 0
fi

# not installed yet
if ! ( type_exists "gnome-shell" ) ; then
  sudo add-apt-repository ppa:gnome3-team/gnome3-staging
  sudo add-apt-repository ppa:gnome3-team/gnome3
  sudo apt update
  sudo apt dist-upgrade
  sudo apt install gnome gnome-shell -y
fi

bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh | sed 's/282c34/262626/g')"
gconftool-2 --set /apps/gnome-terminal/global/default_profile --type string one-dark
