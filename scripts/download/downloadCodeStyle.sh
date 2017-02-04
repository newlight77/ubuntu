#!/bin/bash

downloadCodeStyle() {
  if [ ! -d /apps/styleguide ]; then
    cd /apps
    git clone https://github.com/google/styleguide.git
    cd -
  fi
}

downloadCodeStyle
