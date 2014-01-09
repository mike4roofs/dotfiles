# 
# Git config after update
# If gitconfig does not contain email ( default as is not in the git repo ) 
# ask for it.

cat $HOME/.gitconfig | grep -w "email ="
if [[ $?  -eq 1 ]]; then
  read -e -p "Gitconfig | Set your email: " gitconfig_set_email
  echo $gitconfig_set_email

  $(git config --global user.email $gitconfig_set_email)
fi
