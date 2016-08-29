
#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

if [ "$OS" == "darwin" ]; then
  # Install the `teamocil` Ruby gem
  gem install teamocil
  
  # Create your layout directory
  ln -sf ~/.dotfiles/teamocil/layouts ~/.teamocil
fi
