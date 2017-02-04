#!/bin/bash

postDownload() {
  echo "*** ------ postDownload ------ ***" 1>&2
  mkdir -p ~/.ubuntu
  cat /apps/env.config >> $HOME/.bashrc_path
  echo "*** ------ postDownload done  ------ ***" 1>&2
}

postDownload
