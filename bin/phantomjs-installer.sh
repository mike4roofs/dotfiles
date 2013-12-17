#!/bin/bash

APPLICATION="phantomjs-installer"
VERSION="0.0.1"

# https://code.google.com/p/phantomjs/downloads/list
PHANTOMJS_LATEST_STABLE_VERSION='1.9.2'

# http://stackoverflow.com/a/3182519/715002
USAGE="Usage: $APPLICATION [-hv] command

  Commands:
    install [version]
                  Install the speficied version of phantomjs. If no version is 
                  specified downloads the latest version( hardcoded to $PHANTOMJS_LATEST_STABLE_VERSION )

  Options:
        -h        Print this help screen
        -v        Print version

Version $VERSION"

function usage() {
  echo "$USAGE" >&2
}

# Parse command line options.
while getopts hvo: OPT; do
  case "$OPT" in
    h)
      usage
      exit 0
      ;;
    v)
      echo "$APPLICATION - Version $VERSION"
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
if [ $# -eq 0 ]; then
  usage
  exit 1
fi

# Access additional arguments as usual through 
# variables $@, $*, $1, $2, etc. or using this loop:
PARAM=$@
for PARAM; do
  if [[ $PARAM == 'install' ]]; then
    clipar=($@)
    unset clipar[0]

    if [[ ${#clipar[@]} -eq 0 ]]; then
      version=$PHANTOMJS_LATEST_STABLE_VERSION
    else
      version=${clipar[1]}
    fi

    filename="phantomjs-$version-linux-x86_64"

    url="https://phantomjs.googlecode.com/files/$filename.tar.bz2"

    cd /tmp

    [[ -e $filename.tar.bz2 ]] || wget $url -O $filename.tar.bz2

    [[ -d /opt/bin ]] || mkdir /opt/bin
    [[ -d /opt/phantomjs ]] || mkdir /opt/phantomjs

    tar jxvf $filename.tar.bz2 -C /opt/phantomjs

    ln -s /opt/phantomjs/$filename/bin/phantomjs /opt/bin/phantomjs

    rm $filename.tar.bz2
  fi
done

# EOF
