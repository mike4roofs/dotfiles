# Link files.
function link_header() { e_header "Linking files into home directory"; }

function link_test() {
  [[ "$1" -ef "$2" ]] && echo "same file"
}

function link_do() {
  local link_folder plugin
  
  e_success "Linking ~/$1"

  plugin=$dot_files/link/$1
  link_folder=~/

  # ln -sf $plugin $link_folder
}

function link_footer() { e_success "Completed"; }
