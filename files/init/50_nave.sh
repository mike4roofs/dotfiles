
nave use stable

[[ ! "$(type node)" ]] && nave install stable
[[ ! "$(type npm)" ]] && curl -sSL https://npmjs.org/install.sh | sh

if [[ "$(type node)" ]]; then
  nave use stable
else
  e_error "Can't install nodejs using nave"
fi

if [[ "$(type npm)" ]]; then
  npm install -g yo
  npm install -g bower
  npm install -g grunt-cli
  npm install -g linken
  npm install -g node-inspector
else
  e_error "NPM is not installed for unknown reason"
fi
