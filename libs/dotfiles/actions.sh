# Source specific action to perform them using do_stuff
#
# $1 action name
#    the name of the file in /action to be loaded. Without extension
function add_action() {
  source $dot_folder/actions/$1.sh
}
