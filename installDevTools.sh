#!/bin/bash

LOGFILE=`basename $0`.log

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "***isRoot*** This script must be run as root" 1>&2
   exit 1
 fi
}

createAppsDir () {
  echo "***createAppsDir*** Creating /apps" 1>&2
  $(isRoot)
  mkdir /apps
  echo "***createAppsDir*** done" 1>&2
}

changeAppsRights () {
  echo "***changeAppsRights*** Change access rights to /apps" 1>&2
  $(isRoot)
  chmod -R 755 /apps
  echo "***changeAppsRights*** done" 1>&2
}

#installCassandra () {
  #echo "***installCassandra*** Installing Cassandra" 1>&2
  #cd /apps
  #curl -O http://www.us.apache.org/dist/cassandra/2.2.3/apache-cassandra-2.2.3-bin.tar.gz
  #tar -xvzf apache-cassandra-2.2.3-bin.tar.gz
  #rm apache-cassandra-2.2.3-bin.tar.gz
  #ln -s /apps/apache-cassandra-2.2.3 /apps/cassandra
  #echo "***installCassandra*** done" 1>&2
#}

installJdk8 () {
  echo "***installJdk*** Installing Oracle Jdk8" 1>&2
  cd /apps
  wget http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz
  tar zxvf jdk-8u65-linux-x64.tar.gz
  rm jdk-8u65-linux-x64.tar.gz
  ln -s /apps/jdk1.8.0_65 /apps/jdk8
  alternatives --set java /apps/jdk8/bin
  echo "***installJdk*** done" 1>&2
}

installCassandraAdmin () {
  echo "***installCassandraAdmin*** Installing Cassandra Admin Tool" 1>&2
  cd /apps
  git clone https://github.com/sebgiroux/Cassandra-Cluster-Admin.git
  echo "***installCassandraAdmin*** done" 1>&2
}

# installMaven () {
#   echo "***installMaven*** Installing Maven" 1>&2
#   cd /apps
#   version=3.3.3
#   wget http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz
#   tar zxvf apache-maven-$version-bin.tar.gz
#   rm apache-maven-$version-bin.tar.gz
#   ln -s /apps/apache-maven-$version /apps/maven
#   echo "***installMaven*** done" 1>&2
# }

installTomcat () {
  echo "***installTomcat*** Installing Tomcat" 1>&2
  cd /apps
  version=8.0.36
  wget http://mirrors.ircam.fr/pub/apache/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz
  tar zxvf apache-tomcat-$version.tar.gz
  rm apache-tomcat-$version.tar.gz
  ln -s /apps/apache-tomcat-$version /apps/tomcat
  echo "***installTomcat*** done" 1>&2
}

installDevCenter () {
  echo "***installDevCenter*** Installing Dev Center" 1>&2
  cd /apps
  version=1.5.0
  wget http://downloads.datastax.com/devcenter/DevCenter-$version-linux-gtk-x86_64.tar.gz
  tar -xvzf  DevCenter-$version-linux-gtk-x86_64.tar.gz
  rm DevCenter-$version-linux-gtk-x86_64.tar.gz
  ln -s /apps/DevCenter /apps/devcenter
  echo "***installDevCenter*** done" 1>&2
}

installVSCode () {
  echo "***installVSCode*** Installing VS Code" 1>&2
  cd /apps
  version=0.9.1
  wget https://az764295.vo.msecnd.net/public/$version/VSCode-linux64.zip
  unzip VSCode-linux64.zip
  rm VSCode-linux64.zip
  ln -s /apps/VSCode-linux-x64 /apps/VSCode
  echo "***installVSCode*** done" 1>&2
}

installNetbeans () {
  echo "***installNetbeans*** Installing Unity tweak tools" 1>&2
  cd /apps
  version=8.1
  wget http://download.netbeans.org/netbeans/$version/final/bundles/netbeans-$version-linux.sh
  chmod +x netbeans-$version-linux.sh
  ./netbeans-$version-linux.sh
  echo "***installNetbeans*** done" 1>&2
}

installIdea () {
  echo "***installIdea*** Installing Idea" 1>&2
  cd /apps
  version=2016.1.1
  wget https://download.jetbrains.com/idea/ideaIC-$version.tar.gz
  tar zxvf ideaIC-$version.tar.gz
  rm ideaIC-$version.tar.gz
  ln -s /apps/idea-IC-145.597.3 /apps/idea

  echo "[Desktop Entry]" >> /usr/share/applications/idea.desktop
  echo "Type=Application" >> /usr/share/applications/idea.desktop
  echo "Terminal=true" >> /usr/share/applications/idea.desktop
  echo "Name=Idea" >> /usr/share/applications/idea.desktop
  echo "Icon=/apps/idea/bin/idea.png" >> /usr/share/applications/idea.desktop
  echo "Exec=/apps/idea/bin/idea.sh" >> /usr/share/applications/idea.desktop

  echo "***installIdea*** done" 1>&2
}

installEclipse () {
  echo "***installEclipse*** Installing Eclipse" 1>&2
  cd /apps
  version=mars-2
  wget http://download.springsource.com/release/ECLIPSE/mars/2/eclipse-jee-$version-linux-gtk-x86_64.tar.gz
  tar zxvf eclipse-jee-$version-linux-gtk-x86_64.tar.gz
  rm eclipse-jee-$version-linux-gtk-x86_64.tar.gz
  mv /apps/eclipse /apps/eclipse-mars
  ln -s /apps/eclipse-mars /apps/eclipse

  echo "[Desktop Entry]" >> /usr/share/applications/eclipse.desktop
  echo "Type=Application" >> /usr/share/applications/eclipse.desktop
  echo "Terminal=true" >> /usr/share/applications/eclipse.desktop
  echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
  echo "Icon=/apps/eclipse/eclipse.png" >> /usr/share/applications/eclipse.desktop
  echo "Exec=/apps/eclipse/eclipse" >> /usr/share/applications/eclipse.desktop

  echo "***installEclipse*** done" 1>&2
}

installSts () {
  echo "***installSts*** Installing STS" 1>&2
  cd /apps
  version=3.7.2
  wget http://dist.springsource.com/release/STS/$version.RELEASE/dist/e4.5/spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  tar zxvf spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  rm spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  ln -s /apps/sts-bundle/sts-$version.RELEASE /apps/sts
  echo "***installSts*** done" 1>&2
}

installPlay2 () {
  echo "***installPlay2*** Installing Play2" 1>&2
  cd /apps
  version=1.3.10
  wget https://downloads.typesafe.com/typesafe-activator/$version/typesafe-activator-$version-minimal.zip
  unzip typesafe-activator-$version-minimal.zip
  rm typesafe-activator-$version-minimal.zip
  ln -s /apps/activator-$version-minimal /apps/activator
  echo "***installPlay2*** done" 1>&2
}

addToPath () {
  echo "***addToPath*** Adding apps to PATH" 1>&2

  echo "export PATH=/apps/VSCode:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/idea:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/sts:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/cassandra/bin:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/devcenter/bin:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/tomcat/bin:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/maven/bin:\$PATH" >> ~/.bashrc
  echo "export PATH=/apps/activator:\$PATH" >> ~/.bashrc

  echo "export NPM_PACKAGES=\${HOME}/.npm-global-pkg" >> ~/.bashrc
  echo "export NODE_PATH=\$NPM_PACKAGES/lib/node_modules:\$NODE_PATH" >> ~/.bashrc
  echo "export PATH=\$NPM_PACKAGES/bin:\$PATH" >> ~/.bashrc

  echo "***addToPath*** done" 1>&2
}
