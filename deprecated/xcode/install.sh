#!/bin/bash
set -e

dotfiles=$HOME/.dotfiles
source $dotfiles/script/helper.sh
source $dotfiles/lib/utils

# Check if xCode is present
check_xcode() {
    if ($( xcode-select -p > /dev/null )); then
        e_success "xCode is installed"
    else
        e_warning "The XCode Command Line Tools must be installed first."
        install_xcode
    fi
}

# Install xCode Command Line Tools
install_xcode() {
    e_header "Installing xCode Command Line Tools. Follow the prompt"
    xcode-select --install
    seek_confirmation "Is xCode done installing"

    if is_confirmed; then
        check_xcode
    else
        check_xcode
    fi
}


if [ "$OS" == "darwin" ]; then
  check_xcode
fi
