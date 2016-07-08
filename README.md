dotfiles
==========

It contains the installation and configuration for most of apps I use.

![**iTerm2 + Tmux**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/iterm2+tmux.png)

![**VIM**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/vim.png)

Clone this project:

```bash
git clone git@github.com:maxcnunes/dotfiles.git ~/.dotfiles
```

Bootstrap and install apps:

```bash
cd ~/.dotfiles
sh script/bootstrap.sh
sh script/install.sh
```

## My Current Vim Configurations 

### Configuring VIM

In order to keep simple installing and updating plugins. Lets clone [Vundle](https://github.com/gmarik/Vundle.vim) and use it to install all plugins:

```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## References

Based on few existig vim configuration projects:

- [astrails/dotvim](https://github.com/astrails/dotvim)
- [lucascaton/vimfiles](https://github.com/lucascaton/vimfiles)
- [vinitkumar/.vim](https://github.com/vinitkumar/.vim)
- [tony/vim-config](https://github.com/tony/vim-config)
