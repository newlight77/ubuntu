#!/bin/bash

. ../isRoot.sh

installSublime() {
  echo "***installSublime*** Installing Sublime" 1>&2
  $(isRoot)
  add-apt-repository -y ppa:webupd8team/sublime-text-3
  apt-get update
  apt-get install -y sublime-text-installer
  echo "***installSublime*** done" 1>&2
}

installSublime
