#------------------------------
# RVM
#------------------------------

# check for rvm presence
if [[ -d $HOME/.rvm/bin ]]; then
  # rvm needs to be loaded last in the PATH
  export PATH=$PATH:$HOME/.rvm/bin
fi

# Autoloading .rvmrc files when found
[[ -s ".rvmrc" ]] && source ".rvmrc"  # This loads RVM into a shell session.

# Do not bother when loading .rvmrc ( maybe old? )
export rvmsudo_secure_path=1
