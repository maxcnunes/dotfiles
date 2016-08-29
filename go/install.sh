#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  brew install go
elif [ "$OS" == "linux" ]; then
  echo "Not configured install for Golang"
fi

# gopath
# # mkdir -p ~/go
# # source go/path.sh


# $ go get golang.org/x/tools/cmd/godoc
# $ go get golang.org/x/tools/cmd/vet
# $ go get github.com/golang/lint/golint
