
if [[ ! "$(type rvm)" ]]; then
  \curl -sSL https://get.rvm.io | bash
else
  source "$HOME/.rvm/scripts/rvm"
  rvm get head
fi


if [[ "$(type rvm)" ]]; then
  rvm install 2.0.0
  rvm --default use 2.0.0
else
  e_error "RVM can't be installed or updated for unknown reason"
fi
