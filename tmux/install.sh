#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install tmux
  brew install reattach-to-user-namespace
elif [ "$OS" == "linux" ]; then
  sudo apt-get install -y tmux
fi

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
