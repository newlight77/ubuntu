#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installRuby() {
  echo "*** ------ installRuby ------ ***" 1>&2
  $(isRoot)
  gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable
  source /etc/profile.d/rvm.sh
  rvm install 2.2.4
  rvm use 2.2.4 --default
  echo "*** ------ installRuby done  ------ ***" 1>&2
}

installChrome
