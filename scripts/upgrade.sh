#!/bin/bash

source ../isRoot.sh

# change the value of Prompt=lts to Prompt=normal
# vi /etc/update-manager/release-upgrades

upgradeUbuntu() {
  echo "***installDocker***" 1>&2
  $(isRoot)
  apt-get update

  # Upgrade System Packages
  apt-get upgrade

  # upgrade the system with the latest dependencies and kernels or packages that are held-back by update command
  apt-get dist-upgrade

  # removing junk software from your system in order to free disk space
  apt-get autoremove
  apt-get clean

  # make sure that update-manager-core package is installed on the system
  apt-get install update-manager-core

  do-release-upgrade


  uname –a
  cat /etc/lsb-release
  cat /etc/issue.net
  cat /etc/debian_version

  echo "***installDocker*** done" 1>&2
}

upgradeUbuntu
