
function phantomjs_install() {
  local filename folder version

  version='1.9.2'
  folder="phantomjs-$version-linux-x86_64"
  filename="$folder.tar.bz2"
  url="https://phantomjs.googlecode.com/files/$filename"

  e_header "Installing phantomjs version $version" 

  cd /tmp

  wget $url -O $filename

  tar jxvf $filename -C $appmng_app_dir

  ln -s $appmng_app_dir/$folder/bin/phantomjs $appmng_bin_dir/phantomjs

  rm $filename

  e_success "Done"
}

function phantomjs_uninstall() {
  e_header "Uninstalling phantomjs"  
  
  rm -r $appmng_app_dir

  e_success "Done"
}
