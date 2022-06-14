#!/bin/bash
set -e

if [ "$OS" == "darwin" ]; then
  brew install --cask --appdir="/Applications" tableplus
fi
