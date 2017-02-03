#!/bin/bash

. ../isRoot.sh

installMaven() {
  echo "***installMaven***" 1>&2
  $(isRoot)
  #add-apt-repository "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main"
  #add-apt-repository ppa:andrei-pozolotin/maven3
  #apt-get update
  apt-get purge maven maven2 maven3
  apt-get install -d maven3
  apt-get install maven3

  ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn
  echo "***installMaven*** done" 1>&2
}

installMaven
