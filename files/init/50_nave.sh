
nave use stable

[[ ! "$(type node)" ]] && nave install stable
[[ ! "$(type npm)" ]] && curl -sSL https://npmjs.org/install.sh | sh

if [[ "$(type node)" ]]; then
  nave use stable
else
  e_error "Can't install nodejs using nave"
fi

if [[ "$(type npm)" ]]; then
  npm install -g yo bower grunt-cli linken node-inspector
else
  e_error "NPM is not installed for unknown reason"
fi
