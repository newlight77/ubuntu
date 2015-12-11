#!/bin/bash

sudo su -

add-apt-repository main
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted
  #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
  #add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

apt-get update

dpkg-reconfigure tzdata
apt-get install ntp ntpdate -y
apt-get install git -y
apt-get install curl -y
apt-get install terminator -y
apt-get install libgconf2-4 libnss3-1d libxss1 -y
apt-get install nfs-kernel-server -y
apt-get install python-support -y
apt-get install gvfs-bin -y
apt-get install mongodb-client -y
apt-get install eclipse -y
apt-get install openjdk-8-jdk -y
  #alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/bin
apt-get install build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libx11-dev libxext-dev

#NodeJs
curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
apt-get install nodejs -y
npm install -g nodemon gulp yo


#Docker
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  #apt-get install docker.io -y
  #save   https://pgp.mit.edu/pks/lookup?op=get&search=0xF76221572C52609D in
  #apt-key add  ~/.pgp/c52609d
echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker*
apt-cache policy docker-engine
apt-get install docker-engine -y
usermod -aG docker $LOGNAME
systemctl enable docker

# Docker-compose
curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Phantomjs


#Evernote
add-apt-repository ppa:nvbn-rm/ppa -y
apt-get update
apt-get install everpad -y

#Slack
wget https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-1.2.5-amd64.deb
dpkg -i slack-desktop-1.2.5-amd64.deb
rm slack-desktop-1.2.5-amd64.deb

#Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#dpkg -i google-chrome-stable_current_amd64.deb
apt-get install chromium-browser -y

# Sublime
add-apt-repository ppa:webupd8team/sublime-text-3 -y
apt-get update
apt-get install sublime-text-installer -y

# Cassandra
echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
apt-get update
apt-get install cassandra=2.2.3 -y


#unity-tweak-tool
apt-get install unity-tweak-tool -y
apt-get install compiz -y
apt-get install clipit -y
apt-get install gpick -y

mkdir /apps
chmod -R 777 /apps

exit

cd /apps

#VSCode
curl -O https://az764295.vo.msecnd.net/public/0.9.1/VSCode-linux64.zip
unzip VSCode-linux64.zip
rm VSCode-linux64.zip
ln -s /apps/VSCode-linux-x64 /apps/VSCode

# Idea
curl -O https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-14.1.5.tar.gz
tar zxvf ideaIC-14.1.5.tar.gz
rm ideaIC-14.1.5.tar.gz
ln -s /apps/idea-IC-141.2735.5 /apps/idea

# STS
curl -O http://dist.springsource.com/release/STS/3.7.2.RELEASE/dist/e4.5/spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
tar zxvf spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
rm spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
ln -s /apps/sts-bundle/sts-3.7.2.RELEASE /apps/sts

# Cassandra
#curl -O http://www.us.apache.org/dist/cassandra/2.2.3/apache-cassandra-2.2.3-bin.tar.gz
#tar -xvzf apache-cassandra-2.2.3-bin.tar.gz
#rm apache-cassandra-2.2.3-bin.tar.gz
#ln -s /apps/apache-cassandra-2.2.3 /apps/cassandra

# DevCenter
curl -O http://downloads.datastax.com/devcenter/DevCenter-1.4.1-linux-gtk-x86_64.tar.gz
tar -xvzf  DevCenter-1.4.1-linux-gtk-x86_64.tar.gz
rm DevCenter-1.4.1-linux-gtk-x86_64.tar.gz
ln -s /apps/DevCenter /apps/devcenter

#Tomcat
curl -O http://mirrors.ircam.fr/pub/apache/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz
tar zxvf apache-tomcat-8.0.28.tar.gz
rm apache-tomcat-8.0.28.tar.gz
ln -s /apps/apache-tomcat-8.0.28 /apps/tomcat

#Maven
curl -O http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
tar zxvf apache-maven-3.3.3-bin.tar.gz
rm apache-maven-3.3.3-bin.tar.gz
ln -s /apps/apache-maven-3.3.3 /apps/maven

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

cat .bashrc >> ~/.bashrc
cat .gitconfig >> ~/.gitconfig
