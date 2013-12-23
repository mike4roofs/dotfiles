#!/usr/bin/env bash

echo "Welcome! You are going to install endorama/dotfiles."
echo "Download is starting..."

if [[ ! -d ~/.dotfiles ]]; then
  git clone --recursive git://github.com/endorama/dotfiles.git ~/.dotfiles
else
  echo "A ~/.dotfiles folder already exists, aborting."
fi

bash $HOME/.dotfiles/bin/dotfiles

bash $HOME/.dotfiles/bin/dotfiles -h

exit
