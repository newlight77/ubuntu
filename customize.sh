#!/bin/bash

echo "*** Customize *** Customizing User env" 1>&2

cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
git clone https://github.com/google/styleguide.git
#git clone https://github.com/newlight77/ubuntu.git .ubuntu

mkdir .ubuntu
cp  .bashrc_natelandau ~/.ubuntu/.bashrc_natelandau
cp  .bashrc_profile    ~/.ubuntu/.bashrc_profile
cp  .bashrc_alias      ~/.ubuntu/.bashrc_alias
cp  .bashrc_ps12       ~/.ubuntu/.bashrc_ps12
cp  .gitconfig_alias   ~/.ubuntu/.gitconfig_alias

cat .bashrc_profile    >> ~/.bashrc
cat .gitconfig         >> ~/.gitconfig
