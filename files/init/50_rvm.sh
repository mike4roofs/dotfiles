PATH=$PATH:$HOME/.rvm/bin
source $HOME/.dotfiles/libs/shared/logging.sh
source $HOME/.dotfiles/libs/dotfiles/test_for.sh

function rvm_installer() {
  \curl -sSL https://get.rvm.io | bash
}
test_for_command "rvm"

function ruby_installer() {
  rvm install 2.0.0
  rvm --default use 2.0.0
}
test_for_command "ruby"
