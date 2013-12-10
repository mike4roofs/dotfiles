# Update APT.
if [[ $new_dotfiles_install -eq 1 ]]; then
  e_header "Updating APT"
  sudo apt-get -qq update
  sudo apt-get -qq dist-upgrade
fi
