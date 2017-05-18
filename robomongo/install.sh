#!/bin/bash
set -e
exit 0

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew cask install --appdir="/Applications" robomongo
  ln -sf ~/Dropbox/dotfiles-secret ~/.config/robomongo/robomongo.json
fi

