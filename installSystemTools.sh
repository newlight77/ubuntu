#!/bin/bash

LOGFILE=`basename $0`.log

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "***isRoot*** This script must be run as root" 1>&2
   exit 1
 fi
}

addRepository () {
  echo "***addRepository*** Adding repositories to system in /etc/apt/sources.list.d" 1>&2
  $(isRoot)

  add-apt-repository main
  add-apt-repository universe
  add-apt-repository multiverse
  add-apt-repository restricted
    #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
    #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

  apt-get update >> $LOGFILE
  echo "***addRepository*** done" 1>&2
}

configureTime () {
  echo "***configureTime*** Configuring system time and timezone" 1>&2
  $(isRoot)
  dpkg-reconfigure tzdata
  apt-get install ntp ntpdate -y >> $LOGFILE
  echo "***configureTime*** done" 1>&2
}

installCommonPackages () {
  echo "***installCommonPackages*** Installing common packages" 1>&2
  $(isRoot)
  apt-get install curl -y >> $LOGFILE
  apt-get install mailutils -y
  apt-get install terminator -y >> $LOGFILE
  apt-get install libgconf2-4 libnss3-1d libxss1 -y >> $LOGFILE
  apt-get install nfs-kernel-server -y >> $LOGFILE
  apt-get install python-support -y >> $LOGFILE
  apt-get install gvfs-bin -y >> $LOGFILE

  #required for phantomjs compile
  apt-get install build-essential g++ flex bison gperf ruby perl \
    libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libx11-dev libxext-dev >> $LOGFILE

  apt-get install git -y >> $LOGFILE
  apt-get install nginx -y >> $LOGFILE

  #apt-get install openjdk-8-jdk -y
  add-apt-repository ppa:webupd8team/java
  apt-get update >> $LOGFILE
  apt-get install oracle-java8-installer -y >> $LOGFILE

  apt-get install gksu >> $LOGFILE

  echo "***installCommonPackages*** done" 1>&2
}

installNodejs () {
  echo "***installNodejs*** Installing NodeJs and NPM" 1>&2
  $(isRoot)
  #NodeJs
  curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
  apt-get install nodejs -y >> $LOGFILE
  echo "***installNodejs*** done" 1>&2
}

installDocker () {
  echo "***installDocker*** Installing Docker and compose" 1>&2
  $(isRoot)
  #Docker
  apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    #apt-get install docker.io -y
    #save   https://pgp.mit.edu/pks/lookup?op=get&search=0xF76221572C52609D in
    #apt-key add  ~/.pgp/c52609d
  echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" >> /etc/apt/sources.list.d/docker.list
  #sudo add-apt-repository "deb https://apt.dockerproject.org/repo ubuntu-vivid main"
  apt-get update >> $LOGFILE
  apt-get purge lxc-docker* >> $LOGFILE
  apt-cache policy docker-engine >> $LOGFILE
  apt-get install docker-engine -y >> $LOGFILE
  usermod -aG docker $USER
  #newgrp docker
  groupadd docker
  systemctl enable docker

  #Docker-compose
  curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  echo "***installDocker*** done" 1>&2
}

installCassandra () {
  echo "***installCassandra*** Installing Cassandra" 1>&2
  $(isRoot)
  # Cassandra
  echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
  curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
  apt-get update >> $LOGFILE
  apt-get install cassandra=2.2.3 -y >> $LOGFILE
  systemctl disable cassandra
  echo "***installCassandra*** done" 1>&2
}

installMongoDb () {
  echo "***installMongoDb*** Installing mongodb-client" 1>&2
  $(isRoot)
  #mongodb-client
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
  apt-get install mongodb-org -y >> $LOGFILE
  echo "***installMongoDb*** done" 1>&2
}

installChrome () {
  echo "***installChrome*** Installing Chrome" 1>&2
  $(isRoot)
  #Chrome
  #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  #dpkg -i google-chrome-stable_current_amd64.deb
  apt-get install chromium-browser -y >> $LOGFILE
  echo "***installChrome*** done" 1>&2
}

installAtom () {
  echo "***installAtom*** Installing Atom" 1>&2
  #VSCode
  version=1.7.2
  wget https://github.com/atom/atom/releases/download/v$version/atom-amd64.deb
  dpkg -i atom-amd64.deb >> $LOGFILE
  rm atom-amd64.deb
  #gem install scss_lint >> $LOGFILE
  #apm install linter-scss-lint >> $LOGFILE
  echo "***installAtom*** done" 1>&2
}

installSublime () {
  echo "***installSublime*** Installing Sublime" 1>&2
  $(isRoot)
  # Sublime
  add-apt-repository ppa:webupd8team/sublime-text-3 -y
  apt-get update >> $LOGFILE
  apt-get install sublime-text-installer -y >> $LOGFILE
  echo "***installSublime*** done" 1>&2
}

installVSCode () {
  echo "***installVSCode*** Installing VS Code" 1>&2
  cd /apps
  version=1.1.0
  wget https://az764295.vo.msecnd.net/stable/c212f0908f3d29933317bbc3233568fbca7944b1/vscode-amd64.deb
  dpkg -i vscode-amd64.deb >> $LOGFILE
  rm vscode-amd64.deb
  echo "***installVSCode*** done" 1>&2
}

installSlack () {
  echo "***installSlack*** Installing Slack" 1>&2
  $(isRoot)
  #Slack
  version=2.0.4
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-$version-amd64.deb
  dpkg -i slack-desktop-$version-amd64.deb >> $LOGFILE
  rm slack-desktop-$version-amd64.deb
  echo "***installSlack*** done" 1>&2
}

installEvernote () {
  echo "***installEvernote*** Installing Evernote" 1>&2
  $(isRoot)
  #Evernote
  add-apt-repository ppa:nvbn-rm/ppa -y
  apt-get update >> $LOGFILE
  apt-get install everpad -y >> $LOGFILE
  echo "***installEvernote*** done" 1>&2
}

installMkUsb() {
  echo "***installMkUsb*** Installing mkusb allowing to create bootable usb" 1>&2
  $(isRoot)
  sudo add-apt-repository ppa:mkusb/ppa
  sudo apt-get update >> $LOGFILE
  sudo apt-get install mkusb -y >> $LOGFILE
  echo "***installMkUsb*** done" 1>&2
}

installUnitTweak () {
  echo "***installUnitTweak*** Installing Unity tweak tools" 1>&2
  $(isRoot)
  #unity-tweak-tool
  apt-get install unity-tweak-tool -y >> $LOGFILE
  apt-get install compiz -y >> $LOGFILE
  apt-get install clipit -y >> $LOGFILE
  apt-get install gpick -y >> $LOGFILE
  echo "***installUnitTweak*** done" 1>&2
}

installStarUml() {
  echo "***installStarUml*** Installing StarUml" 1>&2
  $(isRoot)
  version=1.5.3
  wget https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_$version-2ubuntu4.2_amd64.deb
  dpkg -i libgcrypt11_$version-2ubuntu4.2_amd64.deb >> $LOGFILE
  rm libgcrypt11_$version-2ubuntu4.2_amd64.deb
  version=2.7.0
  wget http://staruml.io/download/release/v$version/StarUML-v$version-64-bit.deb
  dpkg -i StarUML-v$version-64-bit.deb >> $LOGFILE
  rm StarUML-v$version-64-bit.deb
  echo "***installStarUml*** done" 1>&2
}
