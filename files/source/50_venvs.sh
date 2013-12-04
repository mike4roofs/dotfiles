export WORKON_HOME="$HOME/.virtualenvs"

# Expect $1 as the venv name
function venv() {
  # echo $#
  # echo $@

  # Check for argument presence
  if [ "$#" -lt 1 ]; then
    echo "1 or more argument required"
    return 1
  fi

  # Get action and arguments
  action=$1
  if [ $# -gt 1 ]; then
    shift
    args=$@
  else
    args=()
  fi

  # perform commands if is the case
  # http://virtualenvwrapper.readthedocs.org/en/latest/command_ref.html#command
  if [[ $action == "show" ]]; then
    # showvirtualenv [env]
    showvirtualenv $args
  elif [[ $action == "new" ]]; then
    # mkvirtualenv [-a project_path] [-i package] [-r requirements_file] [virtualenv options] ENVNAME
    mkvirtualenv $@
  elif [[ $action == "ls" ]]; then
    #lsvirtualenv [-b] [-l] [-h]
    lsvirtualenv $args
  elif [[ $action == "rm" ]]; then
    # rmvirtualenv ENVNAME
    rmvirtualenv $args
  elif [[ $action == "deactivate" ]]; then
    deactivate
  elif [[ $action == "activate" ]]; then
    virtualenv /home/endorama/.virtualenvs/$2/bin/activate
  else
    cd /home/endorama/.virtualenvs/$action
    source bin/activate
    #virtualenv /home/endorama/.virtualenvs/$action/bin/activate
  fi
}

has_virtualenv() {
  if [ -e .venv ]; then
    workon `cat .venv`
  fi
}

#venv_cd () {
#  cd "$@" && has_virtualenv
#}
#alias cd="venv_cd"
