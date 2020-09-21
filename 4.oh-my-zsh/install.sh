#!/bin/bash
set -e

if [ ! -d $HOME/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

  THEMES_PATH=~/.oh-my-zsh/custom/themes
  mkdir -p $THEMES_PATH

  wget \
    -O $THEMES_PATH \
    https://raw.githubusercontent.com/maxcnunes/zsh-me/master/me.zsh-theme
fi
