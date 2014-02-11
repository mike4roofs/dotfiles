# all available applications, will be filled afterwards
export appmng_applications=()
# application bin folder. Is included in the PATH from .bashrc and .zshrc
export appmng_bin_dir="/opt/bin"
# destination folder in which application will be installed
export appmng_dest_dir="/opt"
# store command line arguments for passing them to run() function
export appmng_cli_args=($@)
