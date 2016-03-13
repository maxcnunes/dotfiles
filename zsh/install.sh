brew install zsh

# adds zsh to the list of known shells
command -v zsh | sudo tee -a /etc/shells

# # set your default shell to zsh
# chsh -s /usr/local/bin/zsh