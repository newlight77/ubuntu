#!/bin/bash

downloadPlay2() {
  echo "*** ------ installPlay2 ------ ***" 1>&2
  cd /apps
  version=1.3.10
  wget https://downloads.typesafe.com/typesafe-activator/$version/typesafe-activator-$version-minimal.zip
  unzip typesafe-activator-$version-minimal.zip
  rm typesafe-activator-$version-minimal.zip
  ln -s /apps/activator-$version-minimal /apps/activator
  echo "export PATH=/apps/activator:\$PATH" >> /apps/env.config

  cd -
  echo "*** ------ installPlay2 done  ------ ***" 1>&2
}

downloadPlay2
