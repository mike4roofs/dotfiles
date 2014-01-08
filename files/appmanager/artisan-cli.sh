
function artisan_cli_install() {
  e_header "Installing artisan-cli"  
  
  composer global require johnnyfreeman/artisan-cli:*

  e_success "Done"
}

# function artisan_cli_uninstall() {
#   e_header "Uninstalling artisan-cli"  
  
#   rm -r $appmng_app_dir

#   e_success "Done"
# }

# function artisan_cli_upgrade() {
#   e_header "Upgrading artisan-cli"
  
#   cd $appmng_app_dir && git pull && rake install

#   e_success "Done"
# }
