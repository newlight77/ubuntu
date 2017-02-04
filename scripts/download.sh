#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

download() {
  echo "*** ------ download ------ ***" 1>&2
  #$DIR/download/downloadCassandra.sh
  $DIR/download/downloadDevcenter.sh
  $DIR/download/downloadEclipse.sh
  $DIR/download/downloadIdea.sh
  #$DIR/download/downloadJdk.sh
  $DIR/download/downloadMaven.sh
  #$DIR/download/downloadPlay2.sh
  #$DIR/download/downloadSts.sh
  $DIR/download/downloadTomcat.sh
  $DIR/download/downloadCodeStyle.sh
  echo "*** ------ download done  ------ ***" 1>&2
}

download
