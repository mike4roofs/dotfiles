# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# Update APT.
e_header "Updating APT"
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Install Git Extras
if [[ ! "$(type -P git-extras)" ]]; then
  e_header "Installing Git Extras"
  (
    cd $dot_libs/git-extras &&
    sudo make install
  )
fi
