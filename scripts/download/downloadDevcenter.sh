#!/bin/bash

downloadDevCenter() {
  echo "*** ------ installDevCenter ------ ***" 1>&2
  cd /apps
  version=1.5.0
  wget http://downloads.datastax.com/devcenter/DevCenter-$version-linux-gtk-x86_64.tar.gz
  tar -xvzf  DevCenter-$version-linux-gtk-x86_64.tar.gz /tmp/DevCenter
  rm DevCenter-$version-linux-gtk-x86_64.tar.gz
  ln -s /apps/DevCenter /apps/devcenter

  echo "export PATH=/apps/devcenter/bin:\$PATH" >> /apps/env.config

  cd -
  echo "*** ------ installDevCenter done  ------ ***" 1>&2
}
