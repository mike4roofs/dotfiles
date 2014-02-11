
function rvm_install() {
  e_header "Installing rvm"  
  
  \curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles

  e_success "Done"
}

function rvm_uninstall() {
  e_header "Uninstalling rvm"  
  
  rm -r $appmng_app_dir

  e_success "Done"
}

function rvm_upgrade() {
  e_header "Upgrading rvm"
  
  rvm get stablex

  e_success "Done"
}
