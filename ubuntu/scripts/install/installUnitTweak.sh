#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installUnitTweak() {
  echo "*** ------ installUnitTweak ------ ***" 1>&2
  $(isRoot)
  apt-get install -y unity-tweak-tool
  apt-get install -y compiz
  apt-get install -y clipit
  apt-get install -y gpick
  echo "*** ------ installUnitTweak done  ------ ***" 1>&2
}

installUnitTweak
