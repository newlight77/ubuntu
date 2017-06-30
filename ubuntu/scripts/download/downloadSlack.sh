#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installSlack() {
  echo "*** ------ installSlack ------ ***" 1>&2
  $(isRoot)
  version=2.6.3
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-$version-amd64.deb
  dpkg -i slack-desktop-$version-amd64.deb
  rm slack-desktop-$version-amd64.deb
  echo "*** ------ installSlack done  ------ ***" 1>&2
}

installSlack
