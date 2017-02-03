#!/bin/bash

. ../isRoot.sh

installNodejs5() {
  echo "***uninstallDocker***" 1>&2
  $(isRoot)

  apt-get install libpango1.0-1 libpangox-1.0-1
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  apt-get install -y nodejs
  echo "***installNodejs*** done" 1>&2
}

installNodejs6() {
  echo "***uninstallDocker***" 1>&2
  $(isRoot)

  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  apt-get install -y nodejs
  apt-get install -y build-essential

  echo "***installNodejs*** done" 1>&2
}

installNodejs7() {
  echo "***uninstallDocker***" 1>&2
  $(isRoot)

  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
  apt-get install -y nodejs
  apt-get install -y build-essential

  echo "***installNodejs*** done" 1>&2
}

installNodejs5
