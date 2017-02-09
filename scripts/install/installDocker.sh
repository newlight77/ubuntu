#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installDocker() {
  echo "*** ------ installDocker ------ ***" 1>&2
  $(isRoot)

  add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
  #add-apt-repository -y "deb https://apt.dockerproject.org/repo ubuntu-xenial main"
  #echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list

  apt-get update
  apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
  apt-get install apt-transport-https ca-certificates software-properties-common
  #apt-get install apt-transport-https ca-certificates

  curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
  apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
  #apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  #apt-cache policy docker-engine

  apt-get update
  apt-cache madison docker-engine
  #apt-get -y install docker-engine=1.13.1-0~ubuntu-trusty
  apt-get install -y docker-engine

  groupadd docker
  usermod -aG docker $USER

  systemctl enable docker

  echo "*** ------ installDocker done  ------ ***" 1>&2
}

installDockerCompose() {
  echo "*** ------ installDockerCompose ------ ***" 1>&2
  $(isRoot)

  #curl -L https://github.com/docker/compose/releases/download/1.11.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

  echo "*** ------ installDockerCompose done  ------ ***" 1>&2
}

installDocker
installDockerCompose
