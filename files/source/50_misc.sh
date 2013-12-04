# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export GREP_OPTIONS='--color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# mach displays the basic information about the system
function system_info() {
  echo -e "\nMachine information:" ; uname -a
  echo -e "\nUsers logged on:" ; w -h
  echo -e "\nCurrent date :" ; date
  echo -e "\nMachine status :" ; uptime
  echo -e "\nMemory status :" ; free
  echo -e "\nFilesystem status :" ; df -h
  echo -e "\nTemperature status :" ; sensors
}
