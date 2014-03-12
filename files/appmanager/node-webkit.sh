
function node_webkit_install() {
  local unamem=$(uname -m)
  local url

  echo $unamem

  version='0.9.2'
  folder="nw-$version"

  if [[ $unamem == 'x86_64' ]]; then
    url="https://s3.amazonaws.com/node-webkit/v$version/node-webkit-v$version-linux-x64.tar.gz"
    folder="node-webkit-v$version-linux-x64"
  elif [[ $unamem == 'i386' ]]; then
    url="https://s3.amazonaws.com/node-webkit/v$version/node-webkit-v$version-linux-ia32.tar.gz"
    folder="node-webkit-v$version-linux-ia32"
  else
    e_abort 'Undefined machine architecture'
  fi

  e_header "Installing node-webkit"

  wget $url -O /tmp/nw.tar.gz

  tar xzvf /tmp/nw.tar.gz -C $appmng_app_dir

  ln -s $appmng_app_dir/$folder/nw $appmng_bin_dir/nw
  
  e_success "Done"
  e_arrow "Please copy a proper version of libffmpegsumo.so into the node-webkit folder"
}

function node_webkit_uninstall() {
  e_header "Uninstalling node-webkit"  
  
  rm -r $appmng_app_dir
  rm $appmng_bin_dir/nw

  e_success "Done"
}

# function node_webkit_upgrade() {
#   e_header "Upgrading artisan-cli"
  
#   cd $appmng_app_dir && git pull && rake install

#   e_success "Done"
# }
