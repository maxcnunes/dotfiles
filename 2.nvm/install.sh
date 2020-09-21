#!/bin/bash
set -e

# Install nvm
brew install nvm

export NVM_DIR="$HOME/.nvm"

# Create system directory for nvm
mkdir -p $NVM_DIR

# Force load nvm immeditially
source $(brew --prefix nvm)/nvm.sh

# Install latest NodeJS
nvm install node

# Node modules
npm install -g diff-so-fancy
npm install --global git-open
