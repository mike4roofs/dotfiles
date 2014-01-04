autoload -U promptinit && promptinit
autoload -U colors && colors

# PROMPT='%{$fg_bold[green]%}[%n@%M%{$reset_color%} %{$fg_bold[blue]%}%~]$ %{$reset_color%}% $(git_super_status)'
PROMPT='%{$fg_bold[green]%}[%M%{$reset_color%} %{$fg_bold[blue]%}%~]$ %{$reset_color%}% $(git_super_status)'

RPROMPT='[%* on %D]' # prompt for right side of screen
