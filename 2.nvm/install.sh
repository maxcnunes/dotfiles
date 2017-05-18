#!/bin/bash
set -e

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Force load nvm immeditially
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Install latest NodeJS
nvm install node

# Node modules
npm install -g diff-so-fancy
