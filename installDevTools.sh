#!/bin/bash

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
 fi
}

createAppsDir () {
  echo "Creating /apps" 1>&2
  $(isRoot)
  mkdir /apps
  chmod -R 777 /apps
}

installVSCode () {
  echo "Installing VS Code" 1>&2
  cd /apps
  #VSCode
  curl -O https://az764295.vo.msecnd.net/public/0.9.1/VSCode-linux64.zip
  unzip VSCode-linux64.zip
  rm VSCode-linux64.zip
  ln -s /apps/VSCode-linux-x64 /apps/VSCode
}

installNetbeans () {
  echo "Installing Unity tweak tools" 1>&2
  cd /apps
  #NetBeans
  cur -O http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-linux.sh
  chmod +x netbeans-8.1-linux.sh
  ./netbeans-8.1-linux.sh
}

installIdea () {
  echo "Installing Idea" 1>&2
  cd /apps
  # Idea
  curl -O https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-14.1.5.tar.gz
  tar zxvf ideaIC-14.1.5.tar.gz
  rm ideaIC-14.1.5.tar.gz
  ln -s /apps/idea-IC-141.2735.5 /apps/idea

  sudo su -
  #IntelliJ shortcut
  echo "[Desktop Entry]" >> /usr/share/applications/idea.desktop
  echo "Type=Application" >> /usr/share/applications/idea.desktop
  echo "Terminal=true" >> /usr/share/applications/idea.desktop
  echo "Name=Idea" >> /usr/share/applications/idea.desktop
  echo "Icon=/apps/idea/bin/idea.png" >> /usr/share/applications/idea.desktop
  echo "Exec=/apps/idea/bin/idea.sh" >> /usr/share/applications/idea.desktop

  cat .bashrc-root >> ~/.bashrc
  exit
}

installSts () {
  echo "Installing STS" 1>&2
  cd /apps
  # STS
  curl -O http://dist.springsource.com/release/STS/3.7.2.RELEASE/dist/e4.5/spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  tar zxvf spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  rm spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  ln -s /apps/sts-bundle/sts-3.7.2.RELEASE /apps/sts
}

installCassandra () {
  echo "Installing Cassandra" 1>&2
  cd /apps
  # Cassandra
  #curl -O http://www.us.apache.org/dist/cassandra/2.2.3/apache-cassandra-2.2.3-bin.tar.gz
  #tar -xvzf apache-cassandra-2.2.3-bin.tar.gz
  #rm apache-cassandra-2.2.3-bin.tar.gz
  #ln -s /apps/apache-cassandra-2.2.3 /apps/cassandra

}

installCassandraAdmin () {
  echo "Installing Cassandra Admin Tool" 1>&2
  cd /apps
  #Cassandra-Cluster-Admin
  git clone https://github.com/sebgiroux/Cassandra-Cluster-Admin.git
}

installDevCenter () {
  echo "Installing Dev Center" 1>&2
  cd /apps
  # DevCenter
  curl -O http://downloads.datastax.com/devcenter/DevCenter-1.4.1-linux-gtk-x86_64.tar.gz
  tar -xvzf  DevCenter-1.4.1-linux-gtk-x86_64.tar.gz
  rm DevCenter-1.4.1-linux-gtk-x86_64.tar.gz
  ln -s /apps/DevCenter /apps/devcenter
}

installTomcat () {
  echo "Installing Tomcat" 1>&2
  cd /apps
  #Tomcat
  curl -O http://mirrors.ircam.fr/pub/apache/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz
  tar zxvf apache-tomcat-8.0.28.tar.gz
  rm apache-tomcat-8.0.28.tar.gz
  ln -s /apps/apache-tomcat-8.0.28 /apps/tomcat
}

installMaven () {
  echo "Installing Maven" 1>&2
  cd /apps
  #Maven
  curl -O http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
  tar zxvf apache-maven-3.3.3-bin.tar.gz
  rm apache-maven-3.3.3-bin.tar.gz
  ln -s /apps/apache-maven-3.3.3 /apps/maven
}

addToPath () {
  echo "Adding apps to PATH" 1>&2

  echo "export PATH=/apps/VSCode:$PATH" >> ~/.bashrc
  echo "export PATH=/apps/idea:$PATH" >> ~/.bashrc
  echo "export PATH=/apps/sts:$PATH" >> ~/.bashrc
  echo "export PATH=/apps/cassandra/bin:$PATH" >> ~/.bashrc
  echo "export PATH=/apps/devcenter/bin:$PATH" >> ~/.bashrc
  echo "export PATH=/apps/tomcat/bin:$PATH" >> ~/.bashrc
  echo "export PATH=/apps/maven/bin:$PATH" >> ~/.bashrc
}
