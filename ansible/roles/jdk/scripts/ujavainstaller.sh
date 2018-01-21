#!/bin/bash

# ujavainstaller.sh - Ubuntu Java Installer (Oracle JDK)
# Copyright 2016 Adam Scheller (adamscheller.com)
# To get the newest version of the script or to contribute, visit:
# https://github.com/AdamScheller/UbuntuJavaInstaller
# Licensed under MIT (see LICENSE file distributed with this package)

ORACLE_DOWNLOAD_LINK="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"

# Functions
# Displays script usage
function display_usage {
   echo "Usage:   $0 [options] jdk-archive-file.tar.gz"
}

# Displays help (--help option)
function display_help {
   echo "Help page"
   echo
   echo "Download the desired JDK archive (.tar.gz) from Oracle website:"
   echo $ORACLE_DOWNLOAD_LINK
   echo
   display_usage
   echo
   echo "Example: $0 --remove-openjdk jdk-8u71-linux-x64.tar.gz"
   echo
   echo "Available options are:"
   echo "  --remove-openjdk"
   echo "      Removes (purges) OpenJDK from the system. Using this option"
   echo "      ensures that OpenJDK is not present in the system, therefore"
   echo "      no application will use it instead of Oracle JDK."
   echo "      Use this option with caution, as APT may remove other packages"
   echo "      through dependencies. Before APT start removing OpenJDK from"
   echo "      the system it will ask for your confirmation and display"
   echo "      a complete list of software it is going to remove along with"
   echo "      OpenJDK."
   echo
   echo "  --help"
   echo "      Displays this help message."
   echo
}


# Start of the script
echo
echo Ubuntu Java Installer
echo

# Display usage information if no parameters were provided
if [ $# -eq 0 ]; then
   display_usage
   exit 1
fi

# Check what options were provided
REMOVE_OPENJDK=false
JDK_ARCHIVE=""
OPTS=`getopt -q -o '' -l remove-openjdk,help -- "$@"`
while true; do
   case "$1" in
      --remove-openjdk ) REMOVE_OPENJDK=true; shift ;;
      --help ) display_help; exit 1; shift ;;
      -- ) shift; break ;;
      -* ) echo "Unrecognized option $1"
           echo
           exit 1;;
      * ) JDK_ARCHIVE=$1; break ;;
   esac
done

# Check if the script is running with root permissions
if [ `id -u` -ne 0 ]; then
   echo "The script must be run as root! (you can use sudo)"
   exit 1
fi

# Verify the provided JDK archive file
#   Is the file provided?
if [ -z "$JDK_ARCHIVE" ]; then
   display_usage
   exit 1
fi

#   Is the file existing?
if [ ! -f $JDK_ARCHIVE ]; then
   echo "Provided file does not exist: $JDK_ARCHIVE"
   echo
   exit 1
fi

#   Is the file a valid archive?
echo -n "Validating the archive file... "
gunzip -t $JDK_ARCHIVE 2>> /dev/null
if [ $? -ne 0  ]; then
   echo "FAILED"
   echo
   echo "Provided file is not a valid .tar.gz archive: $JDK_ARCHIVE"
   echo
   echo "Be sure to download Linux .tar.gz package from the Oracle website"
   echo $ORACLE_DOWNLOAD_LINK
   echo
   exit 1
fi

#   Is the file containing JDK?
#   Also obtain JDK version using the occassion
JDK_VERSION=`tar -tf $JDK_ARCHIVE | egrep '^[^/]+/$' | head -c -2` 2>> /dev/null
if [[ $JDK_VERSION != "jdk"* ]]; then
   echo "FAILED"
   echo
   echo "The provided archive does not contain JDK: $JDK_ARCHIVE"
   echo
   echo "Please provide valid JDK archive from Oracle Website"
   echo $ORACLE_DOWNLOAD_LINK
   echo
   exit 1
fi
echo "OK"


# All checks are done at this point


# Begin Java installation

# Extract the archive
echo -n "Extracting the archive... "
JDK_LOCATION=/usr/local/java/$JDK_VERSION
mkdir -p /usr/local/java
tar -xf $JDK_ARCHIVE -C /usr/local/java
echo "OK"

# Update /etc/profile
echo -n "Updating /etc/profile ... "
cat >> /etc/profile <<EOF
JAVA_HOME=$JDK_LOCATION
JRE_HOME=$JDK_LOCATION/jre
PATH=$PATH:$JDK_LOCATION/bin:$JDK_LOCATION/jre/bin
export JAVA_HOME
export JRE_HOME
export PATH
EOF
echo "OK"

# Update system to use Oracle Java by default
echo -n "Updating system alternatives... "
update-alternatives --install "/usr/bin/java" "java" "$JDK_LOCATION/jre/bin/java" 1 >> /dev/null
update-alternatives --install "/usr/bin/javac" "javac" "$JDK_LOCATION/bin/javac" 1 >> /dev/null
update-alternatives --set java $JDK_LOCATION/jre/bin/java >> /dev/null
update-alternatives --set javac $JDK_LOCATION/bin/javac >> /dev/null
echo "OK"

# Purge OpenJDK if the option was provided
if [ "$REMOVE_OPENJDK" = true ]; then
   echo "Purging OpenJDK... "
   apt-get purge -q openjdk-\*
fi


# Verify and exit installation
echo -n "Verifying Java installation... "
JAVA_CHECK=`java -version 2>&1`
if [[ "$JAVA_CHECK" == *"Java(TM) SE Runtime Environment"* ]]; then
   echo "OK"
   echo
   echo "Java is successfully installed!"
   echo
   java -version
   echo
   exit 0
else
   echo "FAILED"
   echo
   echo "Java installation failed!"
   echo
   exit 1
fi

# vim: set expandtab ts=3 sw=3 ai:
