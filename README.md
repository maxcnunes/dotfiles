dotfiles
==========

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

Some configurations are easier manually *(or I'm too tired to automate them right now)*.

## Linux: Gnome extensions from Chrome

* [Workspaces to Dock](https://extensions.gnome.org/extension/427/workspaces-to-dock/)
* [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
* [Transparent Top Bar](https://extensions.gnome.org/extension/857/transparent-top-bar/)
* [Dynamic Top Bar](https://extensions.gnome.org/extension/885/dynamic-top-bar/)

## Linux: Terminal Font

Although the font is automatically download to `~/.fonts`. I could not set automatically the gnome terminal font. So we need to do it manually changing the font to: `SauceCodePro Nerd Font Semibold 11`.

## References

Based on few existig vim configuration projects:

- [astrails/dotvim](https://github.com/astrails/dotvim)
- [lucascaton/vimfiles](https://github.com/lucascaton/vimfiles)
- [vinitkumar/.vim](https://github.com/vinitkumar/.vim)
- [tony/vim-config](https://github.com/tony/vim-config)
