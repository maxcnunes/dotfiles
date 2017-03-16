# ln -sf ~/Dropbox/dotfiles-secret/ssh/* ~/.ssh
mkdir -p ~/Development
mkdir -p ~/.ssh
cp ssh/* ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
find ~/Dropbox/dotfiles-secret/ssh | xargs -I {} ln -sf {} ~/.ssh/
