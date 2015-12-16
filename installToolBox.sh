#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. "$DIR/installSystemTools.sh"
. "$DIR/installDevTools.sh"

# Installing System Tools
sudo addRepository
sudo configureTime
sudo installCommonPackages
sudo installNodejs
sudo installDocker
sudo installCassandra
sudo installMongoDb
sudo installChrome
sudo installSublime
sudo installSlack
#sudo installEvernote
sudo installUnitTweak

# Installing Dev Tools
sudo createAppsDir
installCassandra
installCassandraAdmin
installMaven
installTomcat
installVSCode
installDevCenter
#installNetbeans
installIdea
installSts
addToPath

exit
