#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
 brew install zsh
elif [ "$OS" == "linux" ]; then
  sudo apt-get install zsh -y
fi

# adds zsh to the list of known shells
command -v zsh | sudo tee -a /etc/shells

# # set your default shell to zsh
# sudo chsh -s /usr/local/bin/zsh
