function mongodb() {
  #echo "Performing action: $1"

  if [[ $1 == "start" ]]; then
    service mongodb start
  elif [[ $1 == "restart" ]]; then
    service mongodb restart
  elif [[ $1 == "stop" ]]; then
    service mongodb stop
  fi  
}
