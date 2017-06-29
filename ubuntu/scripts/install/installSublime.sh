#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installSublime() {
  echo "*** ------ installSublime ------ ***" 1>&2
  $(isRoot)
  add-apt-repository -y ppa:webupd8team/sublime-text-3
  apt-get update
  apt-get install -y sublime-text-installer
  echo "*** ------ installSublime done  ------ ***" 1>&2
}

installSublime
