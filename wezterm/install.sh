#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install wezterm
elif [ "$OS" == "linux" ]; then
  # TODO: add linux install
  echo "Not implemented"
  exit 1
fi

if ! [ -L ~/.config/wezterm  ]; then
  ln -s $dotfiles/wezterm ~/.config/wezterm
fi
