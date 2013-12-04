# This file is sourced at the end of a first-time dotfiles install.
shopt -s expand_aliases
source $dot_files/source/50_net.sh

# I'm forgetful. Just look at this repo's commits to see how many times I
# forgot to setup Git and GitHub.

cat <<EOF
!!!Please remember your ssh key if you included the .ssh/config file!!!

If this is a remote server, run from your localhost:
ssh-copy-id $USER@$(mypublicip) && ssh $USER@$(mypublicip)
EOF
