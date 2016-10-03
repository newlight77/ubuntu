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
installMkUsb
installSystemLibraries
installCommonTools
#installMaven
installTomcat8
installNodejs
installDocker
installCassandra
#installMongoDb
installChrome
installAtom
installSublime
installVSCode
installStarUml
installSlack
installUnitTweak

# Installing Dev Tools
createAppsDir
#installJdk8
#installCassandra
#installCassandraAdmin
installMaven
# installTomcat
#installVSCode
installDevCenter
#installNetbeans
installIdea
installEclipse
installPlay2
addToPath
changeAppsRights
