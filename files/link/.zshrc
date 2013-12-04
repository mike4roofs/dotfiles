#------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                             #
# Author:   endorama @ github                                      #
# This file is minimal on purpose. If you need to add stuff please #
# look at .dotfiles/files/source/                                  #
#------------------------------------------------------------------#

# Add binaries into the path
PATH=~/.dotfiles/bin:$PATH
export PATH

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/files/source/$1.sh"
  else
    for file in ~/.dotfiles/files/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

src
