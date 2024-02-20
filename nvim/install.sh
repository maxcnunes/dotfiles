#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install nvim
elif [ "$OS" == "linux" ]; then
  # TODO: add linux install
  echo "Not implemented"
  exit 1
fi

if ! [ -L ~/.config/nvim  ]; then
  ln -s $dotfiles/nvim ~/.config/nvim
fi

echo '==> Installing vim plugins'
nvim --headless "+Lazy! sync" +qa
