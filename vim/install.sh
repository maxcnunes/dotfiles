#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install macvim --override-system-vim
elif [ "$OS" == "linux" ]; then
  sudo apt-get install vim-gnome -y
fi

ln -fs $dotfiles/vim ~/.vim
ln -fs $dotfiles/vim/vimrc ~/.vimrc
mkdir -p ~/.vim/{.backup,.swap}

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo '==> Installing vundle'
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo '==> Installing vim plugins'
vim +PluginInstall +qall
