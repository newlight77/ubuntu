#!/bin/bash

. ../isRoot.sh

installStarUml() {
  echo "***installStarUml*** Installing StarUml" 1>&2
  $(isRoot)
  version=1.5.3
  wget https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_$version-2ubuntu4.2_amd64.deb
  dpkg -i libgcrypt11_$version-2ubuntu4.2_amd64.deb
  rm libgcrypt11_$version-2ubuntu4.2_amd64.deb
  version=2.7.0
  wget http://staruml.io/download/release/v$version/StarUML-v$version-64-bit.deb
  dpkg -i StarUML-v$version-64-bit.deb
  rm StarUML-v$version-64-bit.deb
  echo "***installStarUml*** done" 1>&2
}

installStarUml
