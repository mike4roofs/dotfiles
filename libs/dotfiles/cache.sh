function create_cache_folder() {
  e_header "Create cache directory";

  [[ -z "$dot_cache" ]] && e_abort "\$dot_cache is not set, aborting" 1

  # mkdir -p $dot_cache

  # if [[ ! -d $dot_cache ]]; then
  #   e_error "Cannot create folder. Aborting."
  #   exit 1
  # else
  #   e_ok
  # fi

  e_arrow "pending"
}
