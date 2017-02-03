#!/bin/bash

echo "*** Customize *** Customizing User env" 1>&2

if [ ! -d ~/.bash-git-prompt ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git  ~/.bash-git-prompt
fi

mkdir -p ~/.ubuntu
cp  .bashrc_natelandau ~/.ubuntu/.bashrc_natelandau
cp  .bashrc_profile    ~/.ubuntu/.bashrc_profile
cp  .bashrc_alias      ~/.ubuntu/.bashrc_alias
cp  .bashrc_path       ~/.ubuntu/.bashrc_path
cp  .bashrc_ps12       ~/.ubuntu/.bashrc_ps12
cp  .gitconfig_alias   ~/.ubuntu/.gitconfig_alias
cp  .bashrc            ~/.ubuntu/.bashrc

cat .bashrc_profile    >> ~/.bashrc
cat .gitconfig         >> ~/.gitconfig
