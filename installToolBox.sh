#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. "$DIR/installSystemTools.sh"
. "$DIR/installDevTools.sh"

# Installing System Tools
addRepository
configureTime
installJdk
installMailUtil
installSystemLibraries
installCommonTools
installNodejs
installDocker
installCassandra
#installMongoDb
installChrome
installAtom
installSublime
installVSCode
installSlack
installEvernote
installMkUsb
installUnitTweak

# Installing Dev Tools
createAppsDir
#installJdk8
#installCassandra
#installCassandraAdmin
installMaven
installTomcat
#installVSCode
installDevCenter
#installNetbeans
installIdea
installEclipse
addToPath
changeAppsRights
