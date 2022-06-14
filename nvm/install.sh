#!/bin/bash
set -e

# Install nvm
brew install nvm

export NVM_DIR="$HOME/.nvm"

# Create system directory for nvm
mkdir -p $NVM_DIR

# Force load nvm immeditially
# Disables temporaly error handler for this script especifically.
set +e
\. "$(brew --prefix nvm)/nvm.sh"
set -e

# Install latest NodeJS
nvm install node

# Node modules
npm install --global diff-so-fancy
npm install --global git-open
#npm install -g eslint babel-eslint
