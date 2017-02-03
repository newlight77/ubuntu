#!/bin/bash

. ../isRoot.sh

installSlack() {
  echo "***installSlack*** Installing Slack" 1>&2
  $(isRoot)
  version=2.0.4
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-$version-amd64.deb
  dpkg -i slack-desktop-$version-amd64.deb
  rm slack-desktop-$version-amd64.deb
  echo "***installSlack*** done" 1>&2
}

installSlack
