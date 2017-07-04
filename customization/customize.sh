#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

if [ ! -d ~/.bash-git-prompt ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git  ~/.bash-git-prompt
fi

if [ ! -f ~/.git-completion.bash ]; then
  curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

mkdir -p ~/.ubuntu
cp  ./profile/.bashrc_natelandau ~/.ubuntu/.bashrc_natelandau
cp  ./profile/.bashrc_profile    ~/.ubuntu/.bashrc_profile
cp  ./profile/.bashrc_alias      ~/.ubuntu/.bashrc_alias
cp  ./profile/.bashrc_path       ~/.ubuntu/.bashrc_path
cp  ./profile/.bashrc_ps12       ~/.ubuntu/.bashrc_ps12
cp  ./profile/.gitconfig_alias   ~/.ubuntu/.gitconfig_alias
cp  ./profile/.bashrc            ~/.ubuntu/.bashrc

cat ./profile/.bashrc_profile    >> ~/.bashrc
cat ./profile/.gitconfig         >> ~/.gitconfig
