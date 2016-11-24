#!/bin/bash


LOGFILE=`basename $0`.log


isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "***isRoot*** This script must be run as root" 1>&2
   exit 1
 fi
}


installDocker() {
  echo "***installDocker*** Installing Docker" 1>&2
  $(isRoot)

  #add-apt-repository -y "deb https://apt.dockerproject.org/repo ubuntu-xenial main"
  echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list

  apt-get update >> $LOGFILE
  apt-get install apt-transport-https ca-certificates >> $LOGFILE
  apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D >> $LOGFILE
  apt-cache policy docker-engine  >> $LOGFILE
  apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual >> $LOGFILE

  apt-get install -y docker-engine >> $LOGFILE

  groupadd docker
  usermod -aG docker $USER

  systemctl enable docker
}


uninstallDocker() {
  echo "***uninstallDocker*** Installing Docker-Compose" 1>&2
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

installDockerCompose() {
  echo "***installDockerCompose*** Installing Docker-Compose" 1>&2
  $(isRoot)

  curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

  echo "***installDockerCompose*** done" 1>&2
}

uninstallDockerCompose() {
  echo "***uninstallDockerCompose*** Installing Docker-Compose" 1>&2
  $(isRoot)

  rm /usr/local/bin/docker-compose

  echo "***uninstallDockerCompose*** done" 1>&2
}
