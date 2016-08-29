#!/bin/bash
set -e

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.6/install.sh | bash

# Node modules
npm install -g diff-so-fancy
