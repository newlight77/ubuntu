#!/bin/bash

source ./isRoot.sh

uninstallDocker() {
  echo "***uninstallDocker***" 1>&2
  $(isRoot)

  apt-get remove docker
  apt-get remove --auto-remove docker
  apt-get purge docker
  apt-get purge --auto-remove docker

  apt-get remove docker.io
  apt-get remove --auto-remove docker.io
  apt-get purge docker.io
  apt-get purge --auto-remove docker.io

  apt-get remove docker-engine
  apt-get purge docker-engine
  apt-get autoremove --purge docker-engine

  apt-get autoclean
  apt-get purge lxc-docker*

  rm /etc/apt/sources.list.d/docker.list*
  rm -rf /var/lib/docker
  #sudo rm /etc/apparmor.d/docker
  sudo groupdel docker

  echo "***uninstallDocker*** done" 1>&2
}

uninstallDockerCompose() {
  echo "***uninstallDockerCompose***" 1>&2
  $(isRoot)

  rm /usr/local/bin/docker-compose

  echo "***uninstallDockerCompose*** done" 1>&2
}
