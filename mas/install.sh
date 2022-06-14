#!/bin/bash
set -e

if [ "$OS" == "darwin" ]; then
  # https://github.com/alexramirez/mac-setup
  brew install mas
fi
