ZSH=$HOME/.dotfiles/libs/oh-my-zsh # Path to your oh-my-zsh configuration.
ZSH_THEME="robbyrussell" # Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
DISABLE_AUTO_UPDATE="true" # Comment this out to disable weekly auto-update checks
COMPLETION_WAITING_DOTS="true" # Uncomment following line if you want red dots to be displayed while waiting for completion

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  apt autojump bundler colorize command-not-found cp encode64 extract git 
  git-extras github history-substring-search npm ssh-agent rake rails rvm 
  sublime web-search wp-cli
)

zstyle :omz:plugins:ssh-agent agent-forwarding on

# Contributed codes
source $ZSH/oh-my-zsh.sh
source $ZSH/contrib/git-prompt/zshrc.sh
