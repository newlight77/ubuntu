#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. "$DIR/installSystemTools.sh"
. "$DIR/installDevTools.sh"

# Installing System Tools
addRepository
configureTime
installCommonPackages
installNodejs
installDocker
installCassandra
installMongoDb
installChrome
installAtom
installSublime
installSlack
installEvernote
installUnitTweak

# Installing Dev Tools
createAppsDir
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
