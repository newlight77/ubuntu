#!/bin/bash

echo "*** Customize *** Customizing User env" 1>&2

git clone https://github.com/google/styleguide.git
#git clone https://github.com/newlight77/ubuntu.git .ubuntu

cp  .bashrc_natelandau  ~/.ubuntu/.bashrc_natelandau
cp  .bashrc_profile    ~/.ubuntu/.bashrc_profile
cp  .bashrc_alias      ~/.ubuntu/.bashrc_alias
cp  .gitconfig_alias      ~/.ubuntu/.gitconfig_alias

cat .bashrc       >> ~/.bashrc
cat .gitconfig    >> ~/.gitconfig

git config --global user.name "newlight77"
git config --global user.email "newlight77@gmail.com"

git clone https://github.com/google/styleguide.git

cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

ssh-keygen -t rsa
