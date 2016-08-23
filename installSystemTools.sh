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
  add-apt-repository ppa:webupd8team/java
  add-apt-repository ppa:mkusb/ppa
  add-apt-repository ppa:webupd8team/sublime-text-3 -y
  add-apt-repository ppa:nvbn-rm/ppa -y
  #add-apt-repository "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main"
  add-apt-repository ppa:andrei-pozolotin/maven3
  add-apt-repository "deb https://apt.dockerproject.org/repo ubuntu-vivid main"

  apt-get install apt-transport-https ca-certificates

  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2EA8F35793D8809A
  apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

  #docker
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  apt-get update >> $LOGFILE
  echo "***addRepository*** done" 1>&2
}

configureTime () {
  echo "***configureTime*** Configuring system time and timezone" 1>&2
  $(isRoot)
  dpkg-reconfigure tzdata
  apt-get install -y ntp ntpdate
  echo "***configureTime*** done" 1>&2
}

installJdk () {
  echo "***installJdk*** Installing Oracle Jdk8" 1>&2
  $(isRoot)
  #apt-get install openjdk-8-jdk -y
  #add-apt-repository ppa:webupd8team/java
  #apt-get update >> $LOGFILE
  apt-get install -y oracle-java8-installer

  echo "***installJdk*** done" 1>&2
}

installMailUtil () {
  echo "***installMailUtil*** Installing mailutil" 1>&2
  $(isRoot)
  apt-get install -y mailutils
  echo "***installMailUtil*** done" 1>&2
}

installMkUsb() {
  echo "***installMkUsb*** Installing mkusb allowing to create bootable usb" 1>&2
  $(isRoot)
  #add-apt-repository ppa:mkusb/ppa
  #apt-get update >> $LOGFILE
  apt-get install -y mkusb
  echo "***installMkUsb*** done" 1>&2
}

installSystemLibraries () {
  echo "***installSystemLibraries*** Installing system libraries" 1>&2
  $(isRoot)

  apt-get install -y libgconf2-4 libnss3-1d libxss1
  apt-get install -y nfs-kernel-server
  apt-get install -y python-support
  apt-get install -y gvfs-bin
  apt-get install apt-transport-https ca-certificates

  #required for phantomjs compile
  apt-get install -y build-essential g++ flex bison gperf ruby perl \
    libsqlite3-dev libfontconfig1-dev libicu52 libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libx11-dev libxext-dev

  echo "***installSystemLibraries*** done" 1>&2
}

installCommonTools () {
  echo "***installCommonTools*** Installing common tools" 1>&2
  $(isRoot)

  apt-get install -y gksu
  apt-get install -y curl
  apt-get install -y terminator
  apt-get install -y git
  apt-get install -y nginx

  echo "***installCommonTools*** done" 1>&2
}

installMaven () {
  echo "***installMaven*** Installing Maven" 1>&2
  $(isRoot)
  #add-apt-repository "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main"
  #add-apt-repository ppa:andrei-pozolotin/maven3
  #apt-get update
  apt-get purge maven maven2 maven3
  apt-get install -d maven3
  apt-get install maven3 >> $LOGFILE

  ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn
  echo "***installMaven*** done" 1>&2
}

installNodejs () {
  echo "***installNodejs*** Installing NodeJs and NPM" 1>&2
  $(isRoot)
  curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
  apt-get install -y nodejs >> $LOGFILE
  echo "***installNodejs*** done" 1>&2
}

installDocker () {
  echo "***installDocker*** Installing Docker and compose" 1>&2
  $(isRoot)
  #Docker
  #apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    #apt-get install docker.io -y
    #save   https://pgp.mit.edu/pks/lookup?op=get&search=0xF76221572C52609D in
    #apt-key add  ~/.pgp/c52609d
  #echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" >> /etc/apt/sources.list.d/docker.list
  #add-apt-repository "deb https://apt.dockerproject.org/repo ubuntu-vivid main"
  #apt-get update >> $LOGFILE
  apt-get purge lxc-docker* >> $LOGFILE
  apt-cache policy docker-engine >> $LOGFILE
  apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
  apt-get install -y docker-engine >> $LOGFILE
  groupadd docker
  usermod -aG docker $USER
  #newgrp docker
  systemctl enable docker

  #Docker-compose
  #curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  echo "***installDocker*** done" 1>&2
}

installCassandra () {
  echo "***installCassandra*** Installing Cassandra" 1>&2
  $(isRoot)
  echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
  curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
  apt-get update >> $LOGFILE
  apt-get install -y cassandra=2.2.3 >> $LOGFILE
  systemctl disable cassandra
  echo "***installCassandra*** done" 1>&2
}

installMongoDb () {
  echo "***installMongoDb*** Installing mongodb-client" 1>&2
  $(isRoot)
  #apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
  apt-get install -y mongodb-org >> $LOGFILE
  echo "***installMongoDb*** done" 1>&2
}

installChrome () {
  echo "***installChrome*** Installing Chrome" 1>&2
  $(isRoot)
  #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  #dpkg -i google-chrome-stable_current_amd64.deb
  apt-get install -y chromium-browser >> $LOGFILE
  echo "***installChrome*** done" 1>&2
}

installAtom () {
  echo "***installAtom*** Installing Atom" 1>&2
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
  #add-apt-repository ppa:webupd8team/sublime-text-3 -y
  #apt-get update >> $LOGFILE
  apt-get install -y sublime-text-installer >> $LOGFILE
  echo "***installSublime*** done" 1>&2
}

installVSCode () {
  echo "***installVSCode*** Installing VS Code" 1>&2
  version=1.1.0
  wget https://az764295.vo.msecnd.net/stable/c212f0908f3d29933317bbc3233568fbca7944b1/vscode-amd64.deb
  dpkg -i vscode-amd64.deb >> $LOGFILE
  rm vscode-amd64.deb
  echo "***installVSCode*** done" 1>&2
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

installSlack () {
  echo "***installSlack*** Installing Slack" 1>&2
  $(isRoot)
  version=2.0.4
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-$version-amd64.deb
  dpkg -i slack-desktop-$version-amd64.deb >> $LOGFILE
  rm slack-desktop-$version-amd64.deb
  echo "***installSlack*** done" 1>&2
}

installEvernote () {
  echo "***installEvernote*** Installing Evernote" 1>&2
  $(isRoot)
  #add-apt-repository ppa:nvbn-rm/ppa -y
  #apt-get update >> $LOGFILE
  apt-get install -y everpad >> $LOGFILE
  echo "***installEvernote*** done" 1>&2
}

installUnitTweak () {
  echo "***installUnitTweak*** Installing Unity tweak tools" 1>&2
  $(isRoot)
  apt-get install -y unity-tweak-tool >> $LOGFILE
  apt-get install -y compiz >> $LOGFILE
  apt-get install -y clipit >> $LOGFILE
  apt-get install -y gpick >> $LOGFILE
  echo "***installUnitTweak*** done" 1>&2
}
