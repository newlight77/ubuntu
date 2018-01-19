#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

addRepository () {
  echo "*** ------ addRepository ------ ***" 1>&2
  echo "*** ------ Adding repositories to system in /etc/apt/sources.list ------ ***" 1>&2
  $(isRoot)

  add-apt-repository main
  add-apt-repository universe
  add-apt-repository multiverse
  add-apt-repository restricted
  #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
  #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

  apt-get update
  echo "*** ------ addRepository done  ------ ***" 1>&2
}

addPublicKeys () {
  echo "*** ------ addRepository ------ ***" 1>&2
  $(isRoot)

  #apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  #apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  #apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2EA8F35793D8809A

  echo "*** ------ addRepository done  ------ ***" 1>&2
}

installSystemLibraries() {
  echo "*** ------ installSystemLibraries ------ ***" 1>&2
  $(isRoot)

  apt-get install -y ntp ntpdate
  apt-get install -y libgconf2-4 libnss3-1d libxss1
  apt-get install -y nfs-kernel-server
  apt-get install -y g++
  apt-get install -y perl
  apt-get install -y ruby
  apt-get install -y flex
  apt-get install -y python
  apt-get install -y python-support
  apt-get install -y gvfs-bin
  apt-get install -y jq
  apt-get install -y curl
  apt-get install -y terminator
  apt-get install -y git
  apt-get install -y apt-transport-https ca-certificates
  apt-get install -y gksu
  apt-get install -y gnome-panel
  apt-get install -y htop

  echo "*** ------ installSystemLibraries done  ------ ***" 1>&2
}

addRepository
addPublicKeys
installSystemLibraries
