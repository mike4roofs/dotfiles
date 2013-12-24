# Install Git Extras
if [[ ! "$(type git-extras)" ]]; then
  e_header "Installing Git Extras"
  (
    cd $dot_libs/git-extras &&
    sudo make install
  )
fi
