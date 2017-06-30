#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

$DIR/scripts/install.sh
$DIR/scripts/fix.sh
$DIR/scripts/createDirs.sh
$DIR/scripts/download.sh
$DIR/scripts/postDownload.sh
