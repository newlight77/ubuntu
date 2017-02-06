#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installAtom() {
  echo "*** ------ installAtom ------ ***" 1>&2
  $(isRoot)
  version=1.7.2
  wget https://github.com/atom/atom/releases/download/v$version/atom-amd64.deb
  dpkg -i atom-amd64.deb
  rm atom-amd64.deb
  #gem install scss_lint
  #apm install linter-scss-lint
  echo "*** ------ installAtom done  ------ ***" 1>&2
}

installAtom
