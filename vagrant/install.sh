#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew cask install --appdir="/Applications" vagrant
  
  vagrant plugin install vagrant-vmware-fusion
  
  echo "Apply the vagrant license with:\n\tvagrant plugin license vagrant-vmware-fusion ~/license.lic"
fi
