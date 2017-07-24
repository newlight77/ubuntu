#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

if [ ! -d ~/.bash-git-prompt ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git  ~/.bash_custom/.bash-git-prompt
fi

if [ ! -f ~/.git-completion.bash ]; then
  curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.bash_custom/.git-completion.bash
fi

mkdir -p ~/..bash_custom
cp  ${DIR}/profile/.bashrc_natelandau ~/.bash_custom/.bashrc_natelandau
cp  ${DIR}/profile/.bashrc_profile    ~/.bash_custom/.bashrc_profile
cp  ${DIR}/profile/.bashrc_alias      ~/.bash_custom/.bashrc_alias
cp  ${DIR}/profile/.bashrc_ps12       ~/.bash_custom/.bashrc_ps12
cp  ${DIR}/profile/.gitconfig_alias   ~/.bash_custom/.gitconfig_alias
cp  ${DIR}/profile/.bashrc            ~/.bash_custom/.bashrc
if [ -z $NPM_PACKAGES ]; then
  cp  ${DIR}/profile/.bashrc_path       ~/.bash_custom/.bashrc_path
fi

cat ${DIR}/profile/.bashrc_profile    >> ~/.bashrc
cat ${DIR}/profile/.gitconfig         >> ~/.gitconfig
