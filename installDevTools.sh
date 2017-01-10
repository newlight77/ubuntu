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
  chmod 777 /apps
  echo "***createAppsDir*** done" 1>&2
}

downloadJdk8 () {
  echo "***installJdk*** Installing Oracle Jdk8" 1>&2
  cd /tmp
  wget http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz
  tar zxvf jdk-8u65-linux-x64.tar.gz
  rm jdk-8u65-linux-x64.tar.gz
  ln -s /apps/jdk1.8.0_65 /apps/jdk8
  alternatives --set java /apps/jdk8/bin

  cd -
  echo "***installJdk*** done" 1>&2
}

downloadCassandra () {
  echo "***installCassandra*** Installing Cassandra" 1>&2
  cd /tmp
  curl -O http://www.us.apache.org/dist/cassandra/2.2.3/apache-cassandra-2.2.3-bin.tar.gz
  tar -xvzf apache-cassandra-2.2.3-bin.tar.gz
  rm apache-cassandra-2.2.3-bin.tar.gz
  ln -s /apps/apache-cassandra-2.2.3 /apps/cassandra

  cd -
  echo "***installCassandra*** done" 1>&2
}

downloadMaven () {
  echo "***installMaven*** Installing Maven" 1>&2
  cd /tmp
  version=3.3.9
  wget http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz
  tar zxvf apache-maven-$version-bin.tar.gz
  rm apache-maven-$version-bin.tar.gz
  rm /apps/maven
  ln -s /apps/apache-maven-$version /apps/maven

  cd -
  echo "***installMaven*** done" 1>&2
}

downloadTomcat () {
  echo "***installTomcat*** Installing Tomcat" 1>&2
  cd /tmp
  version=8.5.8
  wget https://archive.apache.org/dist/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz
  tar zxvf apache-tomcat-$version.tar.gz /tmp
  rm apache-tomcat-$version.tar.gz
  rm /apps/tomcat
  ln -s /apps/apache-tomcat-$version /apps/tomcat

  cd -
  echo "***installTomcat*** done" 1>&2
}

downloadDevCenter () {
  echo "***installDevCenter*** Installing Dev Center" 1>&2
  cd /tmp
  version=1.5.0
  wget http://downloads.datastax.com/devcenter/DevCenter-$version-linux-gtk-x86_64.tar.gz
  tar -xvzf  DevCenter-$version-linux-gtk-x86_64.tar.gz /tmp/DevCenter
  rm DevCenter-$version-linux-gtk-x86_64.tar.gz
  mv /tmp/DevCenter
  rm /apps/devcenter
  ln -s /apps/DevCenter /apps/devcenter

  cd -
  echo "***installDevCenter*** done" 1>&2
}

downloadVSCode () {
  echo "***installVSCode*** Installing VS Code" 1>&2
  cd /tmp
  version=0.9.1
  wget https://az764295.vo.msecnd.net/public/$version/VSCode-linux64.zip
  unzip VSCode-linux64.zip
  rm VSCode-linux64.zip
  ln -s /apps/VSCode-linux-x64 /apps/VSCode

  cd -
  echo "***installVSCode*** done" 1>&2
}

downloadIdea () {
  echo "***installIdea*** Installing Idea" 1>&2
  cd /tmp
  version=2016.3.2
  wget https://download.jetbrains.com/idea/ideaIC-$version.tar.gz
  tar zxvf ideaIC-$version.tar.gz /tmp
  rm ideaIC-$version.tar.gz
  mv /tmp/idea-IC-163.10154.41 /apps/idea-IC-163.10154.41
  rm /apps/idea
  ln -s /apps/idea-IC-163.10154.41 /apps/idea

  cd -
  cp idea.desktop /usr/share/applications/idea.desktop

#  cat << EOF > /usr/share/applications/idea.desktop
#    [Desktop Entry]
#    Encoding=UTF-8
#    Version=1.0
#    Name=IntelliJ IDEA Community Edition
#    Comment=The Drive to Develop
#     Exec=/apps/idea/bin/idea.sh %f
#     Icon=/apps/idea/bin/idea.png
#     Terminal=false
#     Type=Application
#     Categories=Development;IDE;
#     StartupWMClass=jetbrains-idea-ce
# EOF

  echo "***installIdea*** done" 1>&2
}

downloadEclipse () {
  echo "***installEclipse*** Installing Eclipse" 1>&2
  cd /tmp
  version=neon
  minor=2
  wget http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/$version/$minor/eclipse-jee-$version-$minor-linux-gtk-x86_64.tar.gz
  tar zxvf eclipse-jee-$version-$minor-linux-gtk-x86_64.tar.gz
  rm eclipse-jee-$version-$minor-linux-gtk-x86_64.tar.gz
  mv eclipse /apps/eclipse-$version
  rm /apps/eclipse
  ln -s /apps/eclipse-$version /apps/eclipse

  cd -
  cp eclipse.desktop /usr/share/applications/eclipse.desktop
  cp eclipse.png /apps/eclipse/eclipse.png
#   touch /usr/share/applications/eclipse.desktop
#   chmod a+w /usr/share/applications/eclipse.desktop
#   cat <<- EOF > /usr/share/applications/eclipse.desktop
#     [Desktop Entry]
#     Encoding=UTF-8
#     Name=Eclipse
#     Comment=Eclipse IDE
#     Exec=/apps/eclipse/eclipse
#     Icon=/apps/eclipse/eclipse.xpm
#     Terminal=false
#     Type=Application
#     Categories=GNOME;Application;Development;IDE;
#     StartupNotify=true
# EOF

  echo "***installEclipse*** done" 1>&2
}

downloadSts () {
  echo "***installSts*** Installing STS" 1>&2
  cd /tmp
  version=3.7.2
  wget http://dist.springsource.com/release/STS/$version.RELEASE/dist/e4.5/spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  tar zxvf spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  rm spring-tool-suite-$version.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  ln -s /apps/sts-bundle/sts-$version.RELEASE /apps/sts
  cd -
  echo "***installSts*** done" 1>&2
}

downloadPlay2 () {
  echo "***installPlay2*** Installing Play2" 1>&2
  cd /tmp
  version=1.3.10
  wget https://downloads.typesafe.com/typesafe-activator/$version/typesafe-activator-$version-minimal.zip
  unzip typesafe-activator-$version-minimal.zip
  rm typesafe-activator-$version-minimal.zip
  ln -s /apps/activator-$version-minimal /apps/activator
  cd -
  echo "***installPlay2*** done" 1>&2
}
