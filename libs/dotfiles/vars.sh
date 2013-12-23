# Set vars.
# All this variables must be set for correct execution

#  Calc path to dotfiles folder based on the relative position of the dotfiles
#+ executable
root_path=$(dirname $(dirname $0))
# root_path="$HOME/.dotfiles"

# dotfiles main folder
dot_folder=$root_path
# dotfiles action files folder
dot_files="$dot_folder/files"
# dotfiles submodules folder
dot_libs="$dot_folder/libs"
# dotfiles library folder
dot_lib="$dot_folder/libs/dotfiles"
# dotfiles cache folder
dot_cache="$dot_folder/caches"
