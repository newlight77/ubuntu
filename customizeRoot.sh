#!/bin/bash

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "***isRoot*** This script must be run as root" 1>&2
   exit 1
 fi
}

echo "*** Customize *** Customizing User env" 1>&2
$(isRoot)

#git clone https://github.com/newlight77/ubuntu.git .ubuntu

mkdir /root/.ubuntu
cp  .bashrc_natelandau /root/.ubuntu/.bashrc_natelandau
cp  .bashrc_profile    /root/.ubuntu/.bashrc_profile
cp  .bashrc_alias      /root/.ubuntu/.bashrc_alias
cp  .bashrc_ps12       /root/.ubuntu/.bashrc_ps12
cp  .gitconfig_alias   /root/.ubuntu/.gitconfig_alias

cat .bashrc_profile >> ~/.bashrc_profile
cat .bashrc_alias >> ~/.bashrc_alias
cat .bashrc >> ~/.bashrc

#ssh-keygen -t rsa
