#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install the_silver_searcher
elif [ "$OS" == "linux" ]; then
  sudo apt-get install -y silversearcher-ag
fi
