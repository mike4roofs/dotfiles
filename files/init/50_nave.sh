
nave use stable &> /dev/null

[[ ! "$(type node)" ]] && nave install stable
[[ ! "$(type npm)" ]] && curl -sSL https://npmjs.org/install.sh | sh

if [[ "$(type node)" ]]; then
  nave use stable &> /dev/null
else
  e_error "Can't install nodejs using nave"
fi

if [[ "$(type npm)" ]]; then
  npm install -g yo &> /dev/null
  npm install -g bower &> /dev/null
  npm install -g grunt-cli &> /dev/null
  npm install -g linken &> /dev/null
  npm install -g node-inspector &> /dev/null
else
  e_error "NPM is not installed for unknown reason"
fi
