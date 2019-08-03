#!/bin/bash

docker-machine rm -f $(docker-machine ls -q);

boot2docker stop
boot2docker delete

sudo rm -rf /Applications/boot2docker
sudo rm -rf /Applications/Docker

sudo rm -f /usr/local/bin/docker
sudo rm -f /usr/local/bin/boot2docker
sudo rm -f /usr/local/bin/docker-machine
sudo rm -r /usr/local/bin/docker-machine-driver*
sudo rm -f /usr/local/bin/docker-compose
sudo rm -rf /usr/local/share/boot2docker

sudo pkgutil --forget io.docker.pkg.docker
sudo pkgutil --forget io.docker.pkg.dockercompose
sudo pkgutil --forget io.docker.pkg.dockermachine
sudo pkgutil --forget io.boot2dockeriso.pkg.boot2dockeriso

sudo rm -f /private/var/db/receipts/io.boot2docker.*
sudo rm -f /private/var/db/receipts/io.boot2dockeriso.*

rm -rf ~/.boot2docker
rm ~/.ssh/id_boot2docker*
rm -rf ~/.docker

echo "All Done!"
