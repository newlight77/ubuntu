#!/bin/bash

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "***isRoot*** This script must be run as root" 1>&2
   exit 1
 fi
}

echo "*** Customize *** Customizing User env" 1>&2
$(isRoot)

cp  .bashrc_profile >> ~/.bashrc_profile
cp  .bashrc_alias >> ~/.bashrc_alias
cat .bashrc >> ~/.bashrc
ssh-keygen -t rsa
