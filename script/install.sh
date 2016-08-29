#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh

cd "$(dirname $0)"/..

if [ "$OS" == "linux" ]; then
  sudo apt-get update
fi

sh ssh/install.sh
mkdir -p ~/Development
mkdir -p ~/.ssh
cp ssh/* ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
ssh-add

ln -sf ~/.dotfiles/alias.symlink ~/Development/alias.sh
ln -sf ~/.dotfiles/sleep.symlink ~/.sleep
ln -sf ~/Dropbox/dotfiles-secret/.tokenizer.json ~/
ln -sf ~/Dropbox/dotfiles-secret/.sqlectron.json ~/

# find the installers and run them iteratively
find . -name install.sh -not -path "./script/*" | while read installer ;
do
  echo "Installing $installer"
  chmod +x "${installer}"
  $installer
done

# brew install tree
