#!/bin/bash

installChrome() {
  echo "*** ------ installChrome ------ ***" 1>&2
  $(isRoot)
  cd /apps
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb

  cd -
  echo "*** ------ installChrome done  ------ ***" 1>&2
}
