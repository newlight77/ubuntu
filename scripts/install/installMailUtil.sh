#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installMailUtil() {
  echo "*** ------ installMailUtil ------ ***" 1>&2
  $(isRoot)
  debconf-set-selections <<< "postfix postfix/mailname string your.hostname.com"
  debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
  apt-get install -y mailutils
  echo "*** ------ installMailUtil done  ------ ***" 1>&2
}

installMailUtil
