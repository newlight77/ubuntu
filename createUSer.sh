#!/bin/bash

USER=$1
if [ "$USER" == "" ]; then
 echo "Usage : ./createUser.sh username" 1>&2
 exit 1
fi

sudo adduser $USER
sudo mkdir /home/${USER}/.ssh
sudo touch /home/${USER}/.ssh/authorized_keys
sudo chown -R $USER:$USER /home/$USER/.ssh/
sudo chmod 600 /home/$USER/.ssh/authorized_keys
sudo chmod 700 /home/$USER/.ssh
sudo ls -alrt /home/$USER/.ssh/
sudo usermod -aG sudo ${USER}
sudo vi /home/${USER}/.ssh/authorized_keys
