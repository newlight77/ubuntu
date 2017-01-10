#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. "$DIR/installSystemTools.sh"
. "$DIR/installDevTools.sh"

# Installing System Tools
addRepository
configureTime
installSystemLibraries
installCommonTools
installJdk

#installMailUtil
#installMkUsb

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
#downloadJdk8
#downloadCassandra
downloadMaven
# downloadTomcat
downloadDevCenter
#downloadVSCode
#downloadNetbeans
downloadIdea
downloadEclipse
#downloadSts
downloadPlay2
