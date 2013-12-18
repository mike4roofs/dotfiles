
function asciidoc_install() {
  local filename folder version

  version='8.6.9'
  folder="asciidoc-$version"
  filename="$folder.tar.gz"
  url="http://downloads.sourceforge.net/project/asciidoc/asciidoc/$version/$filename"
  
  e_header "Installing asciidoc version $version"  

  cd /tmp
  wget $url -O asciidoc.tar.gz
  
  tar xzvf asciidoc.tar.gz -C $appmng_app_dir

  ln -s $appmng_app_dir/$folder/a2x.py $appmng_bin_dir/a2x
  ln -s $appmng_app_dir/$folder/asciidoc.py $appmng_bin_dir/asciidoc

  rm asciidoc.tar.gz

  e_success "Done"
}

function asciidoc_uninstall() {
  e_header "Uninstalling asciidoc"  
  
  rm -r $appmng_app_dir

  e_success "Done"
}
