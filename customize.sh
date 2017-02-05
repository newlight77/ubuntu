#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

if [ ! -d ~/.bash-git-prompt ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git  ~/.bash-git-prompt
fi

mkdir -p ~/.ubuntu
cp  ./customization/.bashrc_natelandau ~/.ubuntu/.bashrc_natelandau
cp  ./customization/.bashrc_profile    ~/.ubuntu/.bashrc_profile
cp  ./customization/.bashrc_alias      ~/.ubuntu/.bashrc_alias
cp  ./customization/.bashrc_path       ~/.ubuntu/.bashrc_path
cp  ./customization/.bashrc_ps12       ~/.ubuntu/.bashrc_ps12
cp  ./customization/.gitconfig_alias   ~/.ubuntu/.gitconfig_alias
cp  ./customization/.bashrc            ~/.ubuntu/.bashrc

cat ./customization/.bashrc_profile    >> ~/.bashrc
cat ./customization/.gitconfig         >> ~/.gitconfig
