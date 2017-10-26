#!/bin/bash

#############################################
## Global variables
#############################################
OS_FAMILY="linux"
ARCHI="x64"
FILE_TYPE="tar.gz"

#############################################
## Functions
#############################################
error() {
    echo "ERROR : missing or invalid parameters!" >&2
    usage
}

usage() {
  echo "Usage: $0 [options]"
  echo ""
  echo "${blue}Options:   ${reset}"
  echo "${blue}          -o, --os-family =OS           os family : linux|solaris|macosx|windows ${reset}"
  echo "${blue}          -a, --architecture =ARCH      x64|i586 ${reset}"
  echo "${blue}          -f, --file-type =FILE_TYPE    rpm|tar.gz|zip|exe|tar.Z|dmg ${reset}"
  echo "${blue}          -v, --version =VERSION        version number ${reset}"
  echo "${blue}          -h, --help                    help ${reset}"
  exit 1
}

for i in "$@"
  do
    case $i in
        -o=* | --os-family=*)      OS_FAMILY="${i#*=}"     ;;
        -a=* | --architecture=*)   ARCHI="${i#*=}"         ;;
        -f=* | --file-type=*)      FILE_TYPE="${i#*=}"     ;;
        -v=* | --version=*)        VERSION="${i#*=}"       ;;
        -h | --help)           usage                   ;;
        *)                     error                   ;;
    esac
done

FILE_TYPE=$(echo $FILE_TYPE | sed -e "s/\./\\\./")

URL=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html | \
    awk "/downloads\['/ && ! /demos/ && /\['files'\]/ && /${VERSION}-${OS_FAMILY}-${ARCHI}/ && /\.${FILE_TYPE}/" | \
    grep -o "http.*\.${FILE_TYPE}")

echo $URL
