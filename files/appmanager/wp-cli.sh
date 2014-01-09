#
# Appmanager script for wp-cli
# Installation is done via the wp-cli/builds repo
#
# http://wp-cli.org/
#

function _wp_cli_download() {
  git clone https://github.com/wp-cli/builds $appmng_app_dir
}

function wp_cli_install() {
  e_header "Installing wp-cli"  
  
  _wp_cli_download

  chmod +x $appmng_app_dir/phar/wp-cli.phar
  ln -s $appmng_app_dir/phar/wp-cli.phar $appmng_bin_dir/wp

  e_success "Done"
}

function wp_cli_uninstall() {
  e_header "Uninstalling wp-cli"  
  
  rm -r $appmng_app_dir

  e_success "Done"
}

function wp_cli_upgrade() {
  e_header "Upgrading wp-cli"
  
  _wp_cli_download

  e_success "Done"
}
