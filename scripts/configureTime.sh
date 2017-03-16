#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/isRoot.sh

configureTime() {
  echo "*** ------ configureTime ------ ***" 1>&2
  $(isRoot)
  dpkg-reconfigure -f noninteractive tzdata
  echo "*** ------ configureTime done  ------ ***" 1>&2
}

configureTime
