#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/isRoot.sh

install() {
  echo "*** ------ install ------ ***" 1>&2
  $(isRoot)

  $DIR/install/installSystemPackages.sh
  $DIR/install/installJdk.sh # interactive

  $DIR/install/installMailUtil.sh
  $DIR/install/installMkUsb.sh

  #$DIR/install/installMaven.sh
  #$DIR/install/installTomcat8.sh
  $DIR/install/installNodejs.sh
  $DIR/install/installDocker.sh
  $DIR/install/installCassandra.sh

  #$DIR/install/installMongoDb.sh
  $DIR/install/installChrome.sh
  $DIR/install/installSublime.sh
  $DIR/install/installUnitTweak.sh

  echo "*** ------ install done  ------ ***" 1>&2
}

install
