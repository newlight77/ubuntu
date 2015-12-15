#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. "$DIR/installSystemTools.sh"
. "$DIR/installDevTools.sh"
. "$DIR/customize.sh"

# Installing System Tools
addRepository
configureTime
installCommonPackages
installNodejs
installDocker
#installEvernote
installSlack
installChrome
installSublime
installCassandra
installUnitTweak

# Installing Dev Tools
createAppsDir
installVSCode
#installNetbeans
installIdea
installSts
installCassandra
installCassandraAdmin
installDevCenter
installTomcat
installMaven
customizeUserEnv

exit
