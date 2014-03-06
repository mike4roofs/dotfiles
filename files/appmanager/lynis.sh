
function lynis_install() {
  local filename folder version

  version='1.4.4'
  folder="lynis-$version"
  # filename="$folder.tar.gz"
  url="http://cisofy.com/files/lynis-$version.tar.gz"
  checksum="54e68b60a305c13f5a6eda14626e6c80e1ea3b50"
  
  e_header "Installing lynis version $version"  

  cd /tmp
  wget $url -O lynis.tar.gz
  
  tar xzvf lynis.tar.gz -C $appmng_app_dir

  ln -s $appmng_app_dir/$folder/lynis $appmng_bin_dir/lynis

  rm lynis.tar.gz

  e_success "Done"
}

function lynis_uninstall() {
  e_header "Uninstalling lynis"  
  
  rm -r $appmng_app_dir
  rm $appmng_bin_dir/lynis

  e_success "Done"
}
