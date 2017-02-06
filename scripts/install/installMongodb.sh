#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installMongoDb() {
  echo "*** ------ installMongoDb ------ ***" 1>&2
  $(isRoot)
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

  echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
  apt-get update
  apt-get purge mongodb-org*
  apt-get install -y mongodb-org
  systemctl disable mongod
  echo "*** ------ installMongoDb done  ------ ***" 1>&2
}

installMongoDb
