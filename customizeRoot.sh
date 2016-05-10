#!/bin/bash

beRoot() {
  dScript=$0
  if [[ ${UID} -gt 0 ]] ; then
      echo "***bsRoot*** This script will be executed as root" 1>&2
      sudo ${dScript}
      exit
  fi
}

echo "*** Customize *** Customizing bash" 1>&2
$(beRoot)

customizeBash() {
  if [ ! -d /root/.bash-git-prompt ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git  /root/.bash-git-prompt
  fi

  #git clone https://github.com/newlight77/ubuntu.git .ubuntu
  mkdir -p               /root/.ubuntu
  cp  .bashrc_natelandau /root/.ubuntu/.bashrc_natelandau
  cp  .bashrc_profile    /root/.ubuntu/.bashrc_profile
  cp  .bashrc_alias      /root/.ubuntu/.bashrc_alias
  cp  .bashrc_ps12       /root/.ubuntu/.bashrc_ps12
  cp  .gitconfig_alias   /root/.ubuntu/.gitconfig_alias

  cat .bashrc            >> /root/.bashrc
  cat .bashrc_profile    >> /root/.bashrc_profile
  cat .bashrc_alias      >> /root/.bashrc_alias
  cat .gitconfig         >> /root/.gitconfig
}

customizeBash
