
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

# $1 => application name to be escaped
function escape_name() {
  local name; name=$1

  echo "${name//-/_}"
}

function _do_action() {
  local action=$1
  local application=$(escape_name $2)
  local function_name="${application}_$action"

  # check for action availability and return if none
  if [[ ! $(declare -f "$function_name") ]]; then
    echo ""
    e_warn "$action action for $application is not defined"
    return
  else
    [[ -d $appmng_app_dir ]] || mkdir $appmng_app_dir
    "$function_name" "$base" "$file"
  fi
}

# $1 => application name
function is_application() {
  [[ -e $dot_files/appmanager/$1.sh ]] && echo 1
}

function install_application() {
  _do_action 'install' $1
}

function run_application() {
  _do_action 'run' $1
}

function uninstall_application() {
  # Offer the user a chance to skip something.
  REPLY="N"
  read -n 1 -p "Please confirm [y/N]: "
  echo ""
  
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    _do_action 'uninstall' $1
  else
    e_abort "Uninstall not confirmed"
    exit 1
  fi
}
