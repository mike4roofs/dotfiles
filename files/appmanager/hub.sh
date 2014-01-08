
function hub_install() {
  e_header "Installing hub"  
  
  git clone git://github.com/github/hub.git $appmng_app_dir
  cd $appmng_app_dir && rvmsudo rake install

  e_success "Done"
}

function hub_uninstall() {
  e_header "Uninstalling hub"  
  
  rm -r $appmng_app_dir

  e_success "Done"
}

function hub_upgrade() {
  e_header "Upgrading hub"
  
  cd $appmng_app_dir && git pull && rake install

  e_success "Done"
}
