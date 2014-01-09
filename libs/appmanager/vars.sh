# all available applications, will be filled afterwards
export appmng_applications=()
# application bin folder. Is included in the PATH from .bashrc and .zshrc
export appmng_bin_dir="$HOME/.dotfiles/locals/bin"
# destination folder in which application will be installed
export appmng_dest_dir="$HOME/.dotfiles/locals"
# store command line arguments for passing them to run() function
export appmng_cli_args=($@)
