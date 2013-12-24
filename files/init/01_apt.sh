# Update APT.
if [[ $new_dotfiles_install -eq 1 ]]; then
  e_header "Updating APT (this will take some time)"
  sudo apt-get -qq update
  sudo apt-get -qq dist-upgrade
fi

if [[ $new_dotfiles_install -eq 1 ]]; then
  e_header "Installing tree, cowsay"
  sudo apt-get -qq install tree cowsay
fi
