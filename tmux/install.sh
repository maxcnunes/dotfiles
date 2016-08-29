#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install tmux
elif [ "$OS" == "linux" ]; then
  sudo apt-get install -y tmux
fi
