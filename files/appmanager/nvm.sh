
NVM_DIR="$HOME/.nvm"

function nvm_install() {
  e_header "Installing nvm in $NVM_DIR"  
  
  if ! hash git 2>/dev/null; then
    echo >&2 "You need to install git - visit http://git-scm.com/downloads"
    echo >&2 "or, use install-gitless.sh instead."
    exit 1
  fi

  if [ -d "$NVM_DIR" ]; then
    echo "=> NVM is already installed in $NVM_DIR, trying to update"
    echo -ne "\r=> "
    cd $NVM_DIR && git pull
  else
    # Cloning to $NVM_DIR
    git clone https://github.com/creationix/nvm.git $NVM_DIR  
  fi

  e_success "Done"
  e_arrow "Please remember to laod endorama/nvm zsh plugin"
}

function nvm_uninstall() {
  e_header "Uninstalling nvm from $NVM_DIR"  
  
  trash -r $NVM_DIR

  e_success "Done"
}

function nvm_upgrade() {
  e_header "Upgrading nvm"
  
  cd $NVM_DIR && git pull

  e_success "Done"
}
