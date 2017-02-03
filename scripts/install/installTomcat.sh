#!/bin/bash

. ../isRoot.sh

installTomcat8() {
  echo "***installTomcat8*** Installing Tomcat8" 1>&2
  $(isRoot)
  apt-get install -y tomcat8
  echo "***installTomcat8*** done" 1>&2
}

installTomcat8
