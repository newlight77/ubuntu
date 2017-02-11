#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installJdk() {
  echo "*** ------ installJdk ------ ***" 1>&2
  $(isRoot)
  apt-get install -y python-software-properties debconf-utils
  add-apt-repository -y ppa:webupd8team/java
  apt-get update
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
  echo "oracle-java8-installer shared/accepted-oracle-licence-v1-1 select true" | debconf-set-selections
  apt-get install -y oracle-java8-installer

  echo "*** ------ installJdk done  ------ ***" 1>&2
}

installJdk
