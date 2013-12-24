
if [[ $new_dotfiles_install  -eq 1 ]]; then
  read -e -p "Gitconfig | Set your email: " gitconfig_set_email
  echo $gitconfig_set_email

  $(git config --global user.email $gitconfig_set_email)
fi
