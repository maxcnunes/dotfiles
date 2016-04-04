# ln -sf ~/Dropbox/dotfiles-secret/ssh/* ~/.ssh
find ~/Dropbox/dotfiles-secret/ssh | xargs -I {} ln -sf {} ~/.ssh/
