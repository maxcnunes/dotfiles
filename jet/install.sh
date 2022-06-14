#!/bin/bash
set -e

if [ "$OS" == "darwin" ]; then
  brew install --cask codeship/taps/jet
fi
