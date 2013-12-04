## SECURITY CONTROL ON `rm`
# [ Promt on deleting more than 3 files or with recursion ]
alias rm="rm -I"

# config file shortcuts
alias zshconfig="vim ~/.zshrc"
alias zshrc="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias gitconfig="vim ~/.gitconfig"


# SEE PLUGIN # http://apalan.cat/blog/2011/07/24/zsh-no-matches-found/ # alias rake="noglob rake"

# processing
alias processing="/opt/processing-2.0b8/processing-java"

# http://superuser.com/a/439224
alias vim="nocorrect vim"
alias hub="nocorrect hub"
alias git="nocorrect git"
alias ino="nocorrect ino"
alias ssh="nocorrect ssh"

# ls alias
alias ls="ls --color=auto"
alias la="ls -Alh"
alias lag="ls -Alh | grep"

# service alias
alias service="sudo service"

# clean swap ( disable and enable )
alias swapclean="sudo swapoff -a && sudo swapon -a"

# Update font cache
alias update-font-cache="fc-cache -fv"
 
# git shortcuts
alias git="hub"
alias gt="git"
alias g="git"

# makeself
alias makeself="/opt/makeself-2.1.5/makeself.sh"

# python webserver
alias webpython="python -m SimpleHTTPServer"

# nautilus
alias n="nautilus ."
