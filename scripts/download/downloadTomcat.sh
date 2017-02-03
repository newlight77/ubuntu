#!/bin/bash

downloadTomcat() {
  echo "***installTomcat***" 1>&2
  cd /apps
  version=8.5.8
  wget https://archive.apache.org/dist/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz
  tar zxvf apache-tomcat-$version.tar.gz /tmp
  rm apache-tomcat-$version.tar.gz
  ln -s /apps/apache-tomcat-$version /apps/tomcat
  echo "export PATH=/apps/tomcat/bin:\$PATH" >> /apps/env.config

  cd -
  echo "***installTomcat*** done" 1>&2
}

downloadTomcat
