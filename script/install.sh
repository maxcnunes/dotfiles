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

brew install tree

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

# Link secret configurations
ln -sf alias.symlink ~/Development/alias.sh
ln -sf ~/Dropbox/dotfiles-secret/.tokenizer.json ~/
ln -sf ~/Dropbox/dotfiles-secret/.sqlectron.json ~/
