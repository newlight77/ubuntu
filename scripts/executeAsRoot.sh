#!/bin/bash

executeAsRoot() {
  dScript=$@
  if [[ ${UID} -gt 0 ]] ; then
      echo "executeAsRoot : This script will be executed as root" 1>&2
      sudo ${dScript}
      exit
  fi
}

executeAsRoot $@
