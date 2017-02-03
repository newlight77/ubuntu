#!/bin/bash

download() {
  echo "***download***" 1>&2
  #./download/downloadCassandra.sh
  ./download/downloadDevcenter.sh
  ./download/downloadEclipse.sh
  ./download/downloadIdea.sh
  #./download/downloadJdk.sh
  ./download/downloadMaven.sh
  #./download/downloadPlay2.sh
  #./download/downloadSts.sh
  ./download/downloadTomcat.sh
  ./download/downloadCodeStyle.sh
  echo "***download*** done" 1>&2
}

download
