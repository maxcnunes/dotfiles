#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

cd "$(dirname $0)"/..

sh ssh/install.sh
mkdir -p ~/Development
mkdir -p ~/.ssh
cp ssh/* ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
ssh-add

# find the installers and run them iteratively
find . -name install.sh -not -path "./script/*" | while read installer ;
do
  chmod +x "${installer}"
done

# brew install tree

# sh -c xcode/install.sh
# sh -c osx/install.sh
# sh -c homebrew/install.sh
# sh -c sublime/install.sh
# sh -c iterm/install.sh
# sh -c zsh/install.sh
# sh -c oh-my-zsh/install.sh
# sh -c vmware/install.sh
# sh -c vagrant/install.sh
# sh -c chrome/install.sh
# sh -c firefox/install.sh
# sh -c skype/install.sh
# sh -c slack/install.sh
# sh -c spotify/install.sh
# sh -c 1password/install.sh
# sh -c evernote/install.sh
# sh -c slate/install.sh
# sh -c node/install.sh
# sh -c iojs/install.sh
# sh -c go/install.sh
# sh -c tokenizer/install.sh
# sh -c watch/install.sh
# sh -c robomongo/install.sh
# sh -c shuttle/install.sh
# sh -c ssh-tunnel-manager/install.sh
# sh -c dropbox/install.sh

# ln -sf alias.symlink ~/Development/alias.sh
ln -sf /Users/maxcnunes/.dotfiles/alias.symlink /Users/maxcnunes/Development/alias.sh
ln -sf /Users/maxcnunes/.dotfiles/sleep.symlink /Users/maxcnunes/.sleep
ln -sf ~/Dropbox/dotfiles-secret/.tokenizer.json ~/
ln -sf ~/Dropbox/dotfiles-secret/.sqlectron.json ~/


if [ "$(uname)" == "Darwin" ]; then
  # Add Darwin configuration
  echo "Missing Darwin terminal theme configuration"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh | sed 's/282c34/262626/g')"
  gconftool-2 --set /apps/gnome-terminal/global/default_profile --type string one-dark
fi
