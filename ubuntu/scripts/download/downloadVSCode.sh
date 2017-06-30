#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installVSCode() {
  echo "*** ------ installVSCode ------ ***" 1>&2
  wget https://az764295.vo.msecnd.net/stable/379d2efb5539b09112c793d3d9a413017d736f89/code_1.13.1-1497464373_amd64.deb
  dpkg -i vscode-amd64.deb
  rm vscode-amd64.deb
  echo "*** ------ installVSCode done  ------ ***" 1>&2
}

installVSCode
