#!/bin/bash
set -e

if [ ! -d $HOME/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

  ZSH_CUSTOM=~/.oh-my-zsh/custom
  THEMES_PATH=${ZSH_CUSTOM}/themes
  PLUGINS_PATH=${ZSH_CUSTOM}/plugins
  mkdir -p $THEMES_PATH $PLUGINS_PATH

  wget \
    --directory-prefix $THEMES_PATH \
    https://raw.githubusercontent.com/maxcnunes/zsh-me/master/me.zsh-theme

  git clone https://github.com/paulirish/git-open.git $PLUGINS_PATH/git-open
fi
