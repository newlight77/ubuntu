#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installMkUsb() {
  echo "*** ------ installMkUsb ------ ***" 1>&2
  echo "*** ------ installMkUsb : Installing mkusb allowing to create bootable usb" 1>&2

  $(isRoot)
  add-apt-repository -y ppa:mkusb/ppa
  apt-get update
  apt-get install -y mkusb
  echo "*** ------ installMkUsb done  ------ ***" 1>&2
}

installMkUsb
