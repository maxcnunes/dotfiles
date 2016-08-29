#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  # uses https://github.com/mattr-/slate because the oficial proect seems dead
  brew cask install mattr-slate
fi
