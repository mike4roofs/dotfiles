
function get_available_applications() {
  for app in $(ls $dot_files/appmanager); do
    appmng_applications+=("${app%.*}")
  done
}

function show_applications() {
  e_header "Available applications"
  for i in ${appmng_applications[@]}; do
    e_arrow $i
  done
}

function source_applications() {
  for i in ${appmng_applications[@]}; do
    source $dot_files/appmanager/$i.sh
  done
}

function _do_action() {
  local action application
  action=$1
  application=$2

  # check for action availability and return if none
  if [[ ! $(declare -f "$2_$1") ]]; then
    echo ""
    e_warn "$1 action for $2 is not defined"
    return
  else
    [[ -d $appmng_app_dir ]] || mkdir $appmng_app_dir
    "$2_$1" "$base" "$file"
  fi
}

# $1 => application name
function is_application() {
  [[ -e $dot_files/appmanager/$1.sh ]] && echo 1
}

function install_application() {
  _do_action 'install' $1
}

function uninstall_application() {
  _do_action 'uninstall' $1
}
