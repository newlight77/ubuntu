#!/bin/bash

downloadMaven() {
  echo "*** ------ installMaven ------ ***" 1>&2
  cd /apps
  version=3.3.9
  wget http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz
  tar zxvf apache-maven-$version-bin.tar.gz
  rm apache-maven-$version-bin.tar.gz
  ln -s /apps/apache-maven-$version /apps/maven
  echo "export PATH=/apps/maven/bin:\$PATH" >> /apps/env.config

  cd -
  echo "*** ------ installMaven done  ------ ***" 1>&2
}

downloadMaven
