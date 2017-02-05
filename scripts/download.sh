#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

download() {
  echo "*** ------ download ------ ***" 1>&2
  $DIR/download/downloadMaven.sh
  $DIR/download/downloadSlack.sh
  $DIR/download/downloadStarUml.sh
  $DIR/download/downloadDevcenter.sh
  $DIR/download/downloadEclipse.sh
  $DIR/download/downloadTomcat.sh
  $DIR/download/downloadCodeStyle.sh
  $DIR/download/downloadAtom.sh
  $DIR/download/downloadVSCode.sh
  #$DIR/download/downloadCassandra.sh
  #$DIR/download/downloadIdea.sh
  #$DIR/download/downloadJdk.sh
  #$DIR/download/downloadPlay2.sh
  #$DIR/download/downloadSts.sh
  echo "*** ------ download done  ------ ***" 1>&2
}

download
