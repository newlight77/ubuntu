#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installVSCode() {
  echo "*** ------ installVSCode ------ ***" 1>&2
  version=1.1.0
  wget https://az764295.vo.msecnd.net/stable/c212f0908f3d29933317bbc3233568fbca7944b1/vscode-amd64.deb
  dpkg -i vscode-amd64.deb
  rm vscode-amd64.deb
  echo "*** ------ installVSCode done  ------ ***" 1>&2
}

installVSCode
