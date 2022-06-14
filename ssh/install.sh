mkdir -p ~/Development
mkdir -p ~/.ssh

find ~/Dropbox/dotfiles-secret/ssh | xargs -I {} ln -sf {} ~/.ssh/

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

ssh-add
