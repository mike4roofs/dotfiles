# Initialize.
function zshplugins_header() { e_header "Linking Oh My Zsh plugins "; }

function zshplugins_do() {
  local link_folder plugin

  e_success "Linking plugin $1"

  plugin=$dot_files/zshplugins/$1
  link_folder=$dot_folder/libs/oh-my-zsh/custom/plugins/

  if [[ ! -d $link_folder ]]; then
    mkdir $link_folder
  fi

  if [[ ! -d $link_folder ]]; then
    ln -sf $plugin $link_folder
  else
    e_error "Can't create $link_folder"
  fi

}

function zshplugins_footer() { e_success "Completed"; }
