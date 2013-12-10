# Initialize.
function zshplugins_header() { e_header "Linking Oh My Zsh plugins "; }

function zshplugins_do() {
  local link_folder plugin

  e_success "Linking plugin $1"

  plugin=$dot_files/zshplugins/$1
  link_folder=$dot_folder/libs/.oh-my-zsh/custom/plugins/

  ln -sf $plugin $link_folder
}

function zshplugins_footer() { e_success "Completed"; }
