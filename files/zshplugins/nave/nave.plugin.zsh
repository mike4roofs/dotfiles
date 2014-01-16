# Autoload nave if a .node-version file is found

autoload -U add-zsh-hook

load-local-conf() {
  local node_version='.node-version'

  # check file exists, is regular file and is readable:
  if [[ -f $node_version && -r $node_version ]]; then
    nave use $(cat $node_version)
  fi
}

add-zsh-hook chpwd load-local-conf
