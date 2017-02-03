#!/bin/bash

. ./isRoot.sh

install() {
  echo "***install***" 1>&2
  $(isRoot)

  #./install/installSystemPackages.sh
  #./install/installJdk.sh # interactive

  ./install/installMailUtil.sh
  ./install/installMkUsb.sh

  #./install/installMaven.sh
  #./install/installTomcat8.sh
  ./install/installNodejs.sh
  ./install/installDocker.sh
  ./install/installCassandra.sh
  #./install/installMongoDb.sh
  ./install/installChrome.sh
  ./install/installAtom.sh
  ./install/installSublime.sh
  ./install/installVSCode.sh
  ./install/installStarUml.sh
  ./install/installSlack.sh
  ./install/installUnitTweak.sh

  echo "***install*** done" 1>&2
}

install
