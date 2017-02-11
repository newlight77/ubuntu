#!/bin/bash

if [ ! -d "/apps" ]; then
  echo "/apps dir does not exist, nothing to do"
  exit 1;
fi

postDownload() {
  echo "*** ------ postDownload ------ ***" 1>&2
  mkdir -p ~/.ubuntu
  cat /apps/env.config | sort | uniq >> $HOME/.bashrc_path
  echo "*** ------ postDownload done  ------ ***" 1>&2
}

postDownload
