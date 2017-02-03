#!/bin/bash

downloadJdk8() {
  echo "***installJdk***" 1>&2
  cd /apps
  wget http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz
  tar zxvf jdk-8u65-linux-x64.tar.gz
  rm jdk-8u65-linux-x64.tar.gz
  ln -s /apps/jdk1.8.0_65 /apps/jdk8
  alternatives --set java /apps/jdk8/bin

  cd -
  echo "***installJdk*** done" 1>&2
}

downloadJdk8
