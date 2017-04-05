#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/isRoot.sh


sec -i 's/dockerd -H fd/dockerd --storage-driver=overlay -H fd/g' /lib/systemd/system/docker.service

systemctl daemon-reload
systemctl start docker
