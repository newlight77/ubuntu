#!/bin/bash

. ../isRoot.sh

installJdk() {
  echo "***installJdk***" 1>&2
  $(isRoot)
  add-apt-repository ppa:webupd8team/java
  apt-get update
  echo "oracle-java8-installer shared/accepted-oracle-licence-v1-1 select true" | debconf-set-selections
  apt-get install -y oracle-java8-installer

  echo "***installJdk*** done" 1>&2
}

installJdk
