#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installCassandra() {
  echo "*** ------ installCassandra ------ ***" 1>&2
  $(isRoot)
  echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
  curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
  apt-get update
  apt-get install -y dsc30
  apt-get install -y cassandra-tools ## Optional utilities
  systemctl disable cassandra
  echo "*** ------ installCassandra done  ------ ***" 1>&2
}

installCassandra
