#!/bin/bash

downloadCassandra() {
  echo "***installCassandra***" 1>&2
  cd /apps
  curl -O http://www.us.apache.org/dist/cassandra/2.2.3/apache-cassandra-2.2.3-bin.tar.gz
  tar -xvzf apache-cassandra-2.2.3-bin.tar.gz
  rm apache-cassandra-2.2.3-bin.tar.gz
  ln -s /apps/apache-cassandra-2.2.3 /apps/cassandra

  echo "export PATH=/apps/cassandra/bin:\$PATH" >> /apps/env.config

  cd -
  echo "***installCassandra*** done" 1>&2
}
