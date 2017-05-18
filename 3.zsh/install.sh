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
if ! ( grep -q zsh /etc/shells ); then
  command -v zsh | sudo tee -a /etc/shells
fi

chsh -s $(which zsh)

# Important
# In case have problem like "Password: chsh: PAM: Authentication failure".
# Maybe is because the /etc/shells file has an invalid path.
