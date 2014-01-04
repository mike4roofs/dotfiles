# Initialize.
function zshcontribs_header() { e_header "Linking Oh My Zsh contributions "; }

function zshcontribs_do() {
  local contrib=$dot_files/zshcontribs/$1
  local link_folder=$dot_folder/libs/oh-my-zsh/custom/

  e_arrow "Linking contribution $1"

  if [[ ! -d $link_folder ]]; then
    mkdir $link_folder
  fi

  if [[ -d $link_folder ]]; then
    ln -sf $contrib $link_folder
  else
    e_error "Can't create $link_folder"
  fi

}

function zshcontribs_footer() { e_success "Completed"; }
