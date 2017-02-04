#!/bin/bash

. ./isRoot.sh

createAppsDir() {
  echo "*** ------ createAppsDir ------ ***" 1>&2
  $(isRoot)
  mkdir /apps
  chmod 777 /apps
  echo "*** ------ createAppsDir done  ------ ***" 1>&2
}

createAppsDir
