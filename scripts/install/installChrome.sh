#!/bin/bash

. ../isRoot.sh

installChrome() {
  echo "***installChrome***" 1>&2
  $(isRoot)
  #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  #dpkg -i google-chrome-stable_current_amd64.deb
  apt-get install -y chromium-browser
  echo "***installChrome*** done" 1>&2
}

installChrome
