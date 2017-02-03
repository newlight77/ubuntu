#!/bin/bash

downloadSts() {
  echo "***installSts***" 1>&2
  cd /apps
  version=3.7.2
  wget http://dist.springsource.com/release/STS/$version.RELEASE/dist/e4.5/spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  tar zxvf spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  rm spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  ln -s /apps/sts-bundle/sts-$version.RELEASE /apps/sts
  echo "export PATH=/apps/sts:\$PATH" >> /apps/env.config

  cd -
  echo "***installSts*** done" 1>&2
}

downloadSts
