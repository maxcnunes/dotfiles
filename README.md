dotfiles
==========

brew cask install zoomus alfred postman

# iTerm manual settings
* **Theme**: import [One Dark theme](https://github.com/joshdick/onedark.vim/blob/master/term/One%20Dark.itermcolors).
* **Fix Theme Color:** Open iTerm then go to Preferences>Profiles>Default>Color>ANSI Colors and set Black Normal to
  `282c34`.
* **Font**: Set [Monaco for Powerline font](https://github.com/supermarin/powerline-fonts/blob/master/Monaco/Monaco%20for%20Powerline.otf)

It contains the installation and configuration for most of apps I use.

> Important: It is not fully automated yet.

## Appearance

### Darwin

![**iTerm2 + Tmux**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/darwin_iterm2+tmux.png)

![**VIM**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/darwin_vim.png)

### Linux

* Ubuntu 16.04
* Gnome 3.20
* **Appearance config in the desktop image**

![**iTerm2 + Tmux**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/linux_gnome-terminal+tmux.png)

![**VIM**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/linux_vim.png)

![**Linux Desktop**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/linux_desktop.png)

![**Linux Workspaces**](https://raw.githubusercontent.com/maxcnunes/dotfiles/master/images/linux_workspaces.png)

## Install
Clone this project:

```bash
git clone git@github.com:maxcnunes/dotfiles.git ~/.dotfiles
or
git clone https://github.com/maxcnunes/dotfiles.git ~/.dotfiles
```

Install Dropbox and sync the data.

Bootstrap and install apps:

```bash
cd ~/.dotfiles
./script/bootstrap.sh
./script/install.sh
```

## Manual Configurations

### MacOS

* [Trackpad - three finger drag](https://support.apple.com/en-us/HT204609)
* [Font](https://gist.github.com/baopham/1838072)

### Linux

### Gnome extensions from Chrome

* [Workspaces to Dock](https://extensions.gnome.org/extension/427/workspaces-to-dock/)
* [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
* [Transparent Top Bar](https://extensions.gnome.org/extension/857/transparent-top-bar/)
* [Dynamic Top Bar](https://extensions.gnome.org/extension/885/dynamic-top-bar/)

#### Terminal Font

Although the font is automatically download to `~/.fonts`. I could not set automatically the gnome terminal font. So we need to do it manually changing the font to: `SauceCodePro Nerd Font Semibold 10`.

## References

Based on few existig vim configuration projects:

- [astrails/dotvim](https://github.com/astrails/dotvim)
- [lucascaton/vimfiles](https://github.com/lucascaton/vimfiles)
- [vinitkumar/.vim](https://github.com/vinitkumar/.vim)
- [tony/vim-config](https://github.com/tony/vim-config)


```
# https://github.com/alexramirez/mac-setup
brew install mas

# Magnet
mas install 441258766

brew cask install slack
brew cask install codeship/taps/jet
brew cask install spotify
brew cask install charles
brew cask install tableplus
```
