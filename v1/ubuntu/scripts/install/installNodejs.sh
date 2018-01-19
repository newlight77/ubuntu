#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installNodejs() {
  echo "*** ------ installNodejs ------ ***" 1>&2
  $(isRoot)

  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
  apt-get install -y nodejs
  apt-get install -y build-essential

  echo "*** ------ installNodejs done  ------ ***" 1>&2
}

installNodejs
