#
# Composer specific source file

# check if composer is installed
hash composer 2>/dev/null
if [[ $? -eq 0 ]]; then
  # check if is already in the path
  $(echo "$PATH" | grep -wq "$HOME/.composer/vendor/bin")
  if [[ $? -eq 1 ]]; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
  else
  fi
fi
