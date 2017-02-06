#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/isRoot.sh

LOGFILE=`basename $0`.log

echo "" > $LOGFILE

install() {
  echo "*** ------ install ------ ***" 1>&2
  $(isRoot)

  $DIR/install/installSystemPackages.sh >> $LOGFILE
  $DIR/install/configureTime.sh >> $LOGFILE
  $DIR/install/installJdk.sh >> $LOGFILE # interactive
  $DIR/install/installMailUtil.sh >> $LOGFILE
  $DIR/install/installMkUsb.sh >> $LOGFILE

  #$DIR/install/installMaven.sh >> $LOGFILE
  #$DIR/install/installTomcat8.sh >> $LOGFILE
  $DIR/install/installNodejs.sh >> $LOGFILE
  $DIR/install/installDocker.sh >> $LOGFILE
  $DIR/install/installCassandra.sh >> $LOGFILE

  #$DIR/install/installMongoDb.sh >> $LOGFILE
  $DIR/install/installChrome.sh >> $LOGFILE
  $DIR/install/installSublime.sh >> $LOGFILE
  $DIR/install/installUnitTweak.sh >> $LOGFILE

  echo "*** ------ install done  ------ ***" 1>&2
}

install
