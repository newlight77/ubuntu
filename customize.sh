#!/bin/bash

echo "*** Customize *** Customizing User env" 1>&2

cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

cd ~/ubuntu
cp  .bashrc_profile >> ~/.bashrc_profile
cp  .bashrc_alias >> ~/.bashrc_alias
cat .bashrc >> ~/.bashrc
cat .gitconfig >> ~/.gitconfig
git config --global user.name "newlight77"
git config --global user.email "newlight77@gmail.com"
git clone https://github.com/google/styleguide.git

ssh-keygen -t rsa
