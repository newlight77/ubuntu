#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

downloadSqlectron() {
  echo "*** ------ installSqlectron ------ ***" 1>&2
  version=1.22.0
  curl -O https://github.com/sqlectron/sqlectron-gui/releases/download/v$version/Sqlectron_$version_amd64.deb
  dpkg -i Sqlectron_$version_amd64.deb
  rm Sqlectron_$version_amd64.deb
  echo "*** ------ installSqlectron done  ------ ***" 1>&2
}

downloadSqlectron
