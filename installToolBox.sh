#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

$DIR/scripts/install/install.sh
$DIR/scripts/download/download.sh
