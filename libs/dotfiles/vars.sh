# Set vars.
# All this variables must be set for correct execution

#  Calc path to dotfiles folder based on the relative position of the dotfiles
#+ executable
# export dot_root_path=$(dirname $(dirname $0))
dot_root_path="$HOME/.dotfiles"

# dotfiles main folder
export dot_folder=$dot_root_path
# dotfiles action files folder
export dot_files="$dot_folder/files"
# dotfiles submodules folder
export dot_libs="$dot_folder/libs"
# dotfiles library folder
export dot_lib="$dot_folder/libs/dotfiles"
# dotfiles cache folder
export dot_cache="$dot_folder/caches"
