# test of existance of given command
# $1 => command human name
# $2 => command executable ( if none $1 will be used )
#
# Will execute a $1_installer function if command is not found
function test_for_command() {
  local cmd name not_found

  # command human name
  name=$1
  # command executable
  cmd=$2
  # if command is found
  not_found=1

  # init command to name if a second arg is not passed
  [ -z "$2" ] && cmd=$name

  # check if cmd exists ( in PATH see `man hash` )
  hash $cmd 2>/dev/null
  not_found=$?

  e_header "Test for $1"

  # if command is found :)
  if [[ $not_found -eq 0 ]]; then
    e_ok
  # else try to execute $1_installer
  else
    e_arrow "Trying to install missing command $name"

    # check for $1_installer, and execute it if found
    [[ $(declare -f "$1_installer") ]] && "$1_installer"
    
    # check if cmd exists ( in PATH see `man hash` )
    hash $cmd 2>/dev/null
    not_found=$?

    # if is not still missing :)
    if [[ $not_found -eq 0 ]]; then
      e_ok
    # else die
    else
      e_error "$1 must be installed first."
      exit 1
    fi
  fi
}

# test of existance of given variable
# $1 => variable name
# $2 => variable
#
function test_for_var() {
  local var not_found

  # human name
  name=$1
  var=$2
  # if var is found
  not_found=1

  # check if cmd exists ( in PATH see `man hash` )
  [[ "$var" ]] && not_found=0

  e_header "Test for $name"

  # if is found :)
  if [[ $not_found -eq 0 ]]; then
    e_ok
  # else try to execute $1_installer
  else
    e_error "$name must be installed first."
    exit 1
  fi
}
