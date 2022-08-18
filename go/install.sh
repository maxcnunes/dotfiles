#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install go
elif [ "$OS" == "linux" ]; then
  GO_SRC="go1.7.linux-amd64.tar.gz"
  cd /tmp
  wget https://storage.googleapis.com/golang/$GO_SRC
  tar -xf $GO_SRC
  sudo mv go /usr/local
  rm -rf $GO_SRC
fi

mkdir -p ~/Development/go
