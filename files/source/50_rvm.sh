#------------------------------
# RVM
#------------------------------

PATH=$PATH:$HOME/.rvm/bin
export PATH

# Autoloading .rvmrc files when found
[[ -s ".rvmrc" ]] && source ".rvmrc"  # This loads RVM into a shell session.

# Do not bother when loading .rvmrc ( maybe old? )
export rvmsudo_secure_path=1
