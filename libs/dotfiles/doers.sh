# Actually perform deired actions
#
# Automatically load the .sh file from /actions
#
# $1 => action Name of function to be executed
#       $1_header, $1_test, $1_do

function do_stuff() {
  local action action_name base dest skip
  local files=($dot_files/$1/*)

  source $dot_lib/actions.sh
  add_action $1

  # check for action availability and return if none
  if [[ ! $(declare -f "$1_do") ]]; then
    echo ""
    e_warn "$1 action should be performed but is not defined"
    return
  fi

  # echo "$1_do"

  # No files? abort.
  if (( ${#files[@]} == 0 )); then
    e_arrow "No files found"
    return
  fi

  # Run _header function only if declared.
  [[ $(declare -f "$1_header") ]] && "$1_header"
  
  # Iterate over files.
  for file in "${files[@]}"; do
    base="$(basename $file)"
    dest="$HOME/$base"

    # echo "  base: "$base
    # echo "  file: "$file

    # Run _test function only if declared.
    if [[ $(declare -f "$1_test") ]]; then
      
      # If _test function returns a string, skip file and print that message.
      skip="$("$1_test" "$file" "$dest")"
      if [[ "$skip" ]]; then
        e_warn "Skipping ~/$base, $skip"
        continue
      fi
      
      # Destination file already exists in ~/. Back it up!
      if [[ -e "$dest" ]]; then
        
        e_arrow "Backing up ~/$base"
        
        # Set backup flag, so a nice message can be shown at the end.
        backup=1
        
        # Create backup dir if it doesn't already exist.
        [[ -d "$backup_dir" ]] || mkdir -p "$backup_dir"
        
        # Backup file / link / whatever.
        mv "$dest" "$backup_dir"
      
      fi
    fi
    
    # Do stuff.
    "$1_do" "$base" "$file"
    
  done

  # Run _footer function only if declared.
  [[ $(declare -f "$1_footer") ]] && "$1_footer"
}
