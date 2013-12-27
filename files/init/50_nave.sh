PATH=$PATH:$HOME/.dotfiles/bin
source $HOME/.dotfiles/libs/shared/logging.sh
source $HOME/.dotfiles/libs/dotfiles/test_for.sh

nave use stable 1>/dev/null

function node_installer() {
  nave install stable
}
test_for_command "node"

function npm_installer() {
  curl -sSL https://npmjs.org/install.sh | sh
}
test_for_command "npm"

function yo_installer() {
  npm install -g yo 1> /dev/null
}
test_for_command "yo"

function bower_installer() {
  npm install -g bower 1> /dev/null
}
test_for_command "bower"

function grunt_installer() {
  npm install -g grunt 1> /dev/null
}
test_for_command "grunt"

function linken_installer() {
  npm install -g linken 1> /dev/null
}
test_for_command "linken"

function node_inspector_installer() {
  npm install -g node-inspector 1> /dev/null
}
test_for_command "node-inspector"
