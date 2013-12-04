function webserver() {
  #echo "Performing action: $1"

  if [[ $1 == "start" ]]; then
    service apache2 start
    service mysql start
    service postfix start
  elif [[ $1 == "reload" ]]; then
    service apache2 reload
  elif [[ $1 == "restart" ]]; then
    service apache2 stop
    service mysql stop
    service postfix stop

    service apache2 start
    service mysql start
    service postfix start
  elif [[ $1 == "stop" ]]; then
    service apache2 stop
    service mysql stop
    service postfix stop
  fi  
}

function chweb() {
  if [ ! "$#" -eq 1 ]; then
    echo "1 argument required, you need to pass a folder to be chwebbed"
    return 1
  fi
  if [ ! -d "$1" ]; then
    echo "Directory $dir does not exist"
    return 1
  fi

  echo "Setting web permission for: ${1}"
  # http://notfaq.wordpress.com/2006/07/30/unix-filenames-with-spaces-in-find-xargs/

  echo -n "all to www-data group..."
  sudo chown -R endorama:www-data $1
  echo "OK"

  echo -n "all folders to 775..."
  sudo find "$1" -type d -print0 | xargs -0 chmod 775
  echo "OK"

  echo -n "All files to 664..."
  sudo find "$1" -type f -print0 | xargs -0 chmod 664
  echo "OK"

  echo -n "'tmp' named folder to 777..."
  sudo find . -name tmp | xargs chmod 777
  echo "OK"
}
