# all available applications, will be filled afterwards
appmng_applications=()
# application bin folder. Is included in the PATH from .bashrc and .zshrc
appmng_bin_dir="/opt/bin"
# destination folder in which application will be installed
appmng_dest_dir="/opt"
# store command line arguments for passing them to run() function
appmng_cli_args=($@)
