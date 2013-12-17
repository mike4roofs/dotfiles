#! /bin/sh

# USAGE="Usage: `basename $0` [-hv] [-o arg] args"

APPLICATION="chromium-canary"
VERSION="0.0.1"

# http://stackoverflow.com/a/3182519/715002
USAGE="Usage: $APPLICATION [-hv] command [chrome args]
  Use the latest Chromium EVER!

  Commands:
        install   Install a fresh copy of chromium-canary
        run       Execute chromium-canary
                  You can pass CLI flags to this command and will be passed to
                  chrome executable. See:
                  http://peter.sh/experiments/chromium-command-line-switches/
        update    Update chromium-canary to the latest version

  Options:
        -h        Print this help screen
        -v        Print chromium-canary version

Version $VERSION"

function usage() {
  echo "$USAGE" >&2
}

################################################################################

dest_folder="/opt/chromium-canary"

function folder() {
  echo "$dest_folder/$(ls -t $dest_folder | head -n 1)/chrome-linux"
}

function chrome_bin() {
  echo "$(folder)/chrome"
}

function download() {
  cd /tmp
  wget https://download-chromium.appspot.com/dl/Linux_x64 -O chromium-canary.zip

  folder=$dest_folder/$(date +%Y%m%d)

  [[ -e $folder ]] || mkdir $folder

  unzip chromium-canary.zip -d $folder

  # needed for Chrome to have it's sandbox
  sudo chown root:root $folder/chrome-linux/chrome_sandbox
  sudo chmod 4755 $folder/chrome-linux/chrome_sandbox

  rm chromium-canary.zip
}


# Parse command line options.
while getopts hv OPT; do
  case "$OPT" in
    h)
      usage
      exit 0
      ;;
    v)
      echo "$APPLICATION - Version $VERSION"
      $(chrome_bin) --version
      exit 0
      ;;
    \?)
      # getopts issues an error message
      usage
      exit 1
      ;;
  esac
done

# Remove the switches we parsed above.
shift `expr $OPTIND - 1`

# We want at least one non-option argument. 
if [ $# -lt 1 ]; then
  usage
  exit 1
fi

# Access additional arguments as usual through 
# variables $@, $*, $1, $2, etc. or using this loop:
PARAM=$@
for PARAM; do

  if [ $PARAM == 'install' ]; then
    # Only once, and is ugly, but no libudev.0 is available in ubuntu 13.04
    [[ -e "/lib/x86_64-linux-gnu/libudev.so.0" ]] || sudo ln -sf /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0

    download

    exit 0

  elif [[ $PARAM == 'run' ]]; then

    export CHROME_DEVEL_SANDBOX="$(folder)/chrome_sandbox"

    # remove chromium-canary command and pass the rest to chrome executable
    clipar=($@)
    unset clipar[0]

    nohup $(chrome_bin) --user-data-dir=$HOME/.config/chromium-canary ${clipar[@]} &

    exit 0

  elif [[ $PARAM == 'update' ]]; then
    download

    exit 0
  else
    usage
    exit 1
  fi

done

# EOF
