# Copy files.
function copy_header() { e_header "Copying files into home directory"; }

function copy_test() {
  if [[ -e "$2" && ! "$(cmp "$1" "$2" 2> /dev/null)" ]]; then
    echo "same file"
  elif [[ "$1" -ot "$2" ]]; then
    echo "destination file newer"
  fi
}

function copy_do() {
  e_success "Copying ~/$1"
  cp "$2" ~/
}

function copy_footer() { e_success "Completed"; }
