#!/bin/bash

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
 fi
}

addRepository () {
  echo "Adding repositories to system in /etc/apt/sources.list.d" 1>&2
  $(isRoot)

  add-apt-repository main
  add-apt-repository universe
  add-apt-repository multiverse
  add-apt-repository restricted
    #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
    #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

  apt-get update
}

configureTime () {
  echo "Configuring system time and timezone" 1>&2
  $(isRoot)
  dpkg-reconfigure tzdata
  apt-get install ntp ntpdate -y
}

installCommonPackages () {
  echo "Installing common packages" 1>&2
  $(isRoot)
  apt-get install curl -y
  apt-get install terminator -y
  apt-get install libgconf2-4 libnss3-1d libxss1 -y
  apt-get install nfs-kernel-server -y
  apt-get install python-support -y
  apt-get install gvfs-bin -y

  #required for phantomjs compile
  apt-get install build-essential g++ flex bison gperf ruby perl \
    libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libx11-dev libxext-dev

  apt-get install git -y
  apt-get install openjdk-8-jdk -y
  apt-get install nginx -y
  apt-get install mongodb-client -y
}

installNodejs () {
  echo "Installing NodeJs, NPM, gulp, nodemon, yeoman" 1>&2
  $(isRoot)
  #NodeJs
  curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
  apt-get install nodejs -y
  npm install -g nodemon gulp yo
}

installDocker () {
  echo "Installing Docker and compose" 1>&2
  $(isRoot)
  #Docker
  apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    #apt-get install docker.io -y
    #save   https://pgp.mit.edu/pks/lookup?op=get&search=0xF76221572C52609D in
    #apt-key add  ~/.pgp/c52609d
  echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" >> /etc/apt/sources.list.d/docker.list
  #sudo add-apt-repository "deb https://apt.dockerproject.org/repo ubuntu-vivid main"
  apt-get update
  apt-get purge lxc-docker*
  apt-cache policy docker-engine
  apt-get install docker-engine -y
  usermod -aG docker $LOGNAME
  systemctl enable docker

 Docker-compose
  curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

installEvernote () {
  echo "Installing Evernote" 1>&2
  $(isRoot)
  #Evernote
  add-apt-repository ppa:nvbn-rm/ppa -y
  apt-get update
  apt-get install everpad -y
}

installSlack () {
  echo "Installing Slack" 1>&2
  $(isRoot)
  #Slack
  wget https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-1.2.5-amd64.deb
  dpkg -i slack-desktop-1.2.5-amd64.deb
  rm slack-desktop-1.2.5-amd64.deb
}

installChrome () {
  echo "Installing Chrome" 1>&2
  $(isRoot)
  #Chrome
  #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  #dpkg -i google-chrome-stable_current_amd64.deb
  apt-get install chromium-browser -y
}

installSublime () {
  echo "Installing Sublime" 1>&2
  $(isRoot)
  # Sublime
  add-apt-repository ppa:webupd8team/sublime-text-3 -y
  apt-get update
  apt-get install sublime-text-installer -y
}

installCassandra () {
  echo "Installing Cassandra" 1>&2
  $(isRoot)
  # Cassandra
  echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
  curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
  apt-get update
  apt-get install cassandra=2.2.3 -y
}

installUnitTweak () {
  echo "Installing Unity tweak tools" 1>&2
  $(isRoot)
  #unity-tweak-tool
  apt-get install unity-tweak-tool -y
  apt-get install compiz -y
  apt-get install clipit -y
  apt-get install gpick -y
}
