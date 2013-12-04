#------------------------------
# RVM
#------------------------------

# Added by RVM http://rvm.beginrescueend.com/
[[ -s "/home/endorama/.rvm/scripts/rvm" ]] && source "/home/endorama/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Load ruby 2 by default
rvm use 2.1.0 &> /dev/null

# Autoloading .rvmrc files when found
[[ -s ".rvmrc" ]] && source ".rvmrc"  # This loads RVM into a shell session.

# Do not bother when loading .rvmrc ( maybe old? )
export rvmsudo_secure_path=1
