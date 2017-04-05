#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/isRoot.sh

USER=$1
if [ -z "$USER" ] ; then
 echo "Usage : ./createUser.sh username" 1>&2
 exit 1
fi

createUser() {
  adduser $USER
  mkdir /home/${USER}/.ssh
  touch /home/${USER}/.ssh/authorized_keys
  chown -R $USER:$USER /home/$USER/.ssh/
  chmod 600 /home/$USER/.ssh/authorized_keys
  chmod 700 /home/$USER/.ssh
  ls -alrt /home/$USER/.ssh/
  usermod -aG ${USER}
  vi /home/${USER}/.ssh/authorized_keys
}

createUser $@
