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
  echo "${blue}          -h, --help                    help ${reset}"
  exit 1
}

#############################################
## Check arguments
#############################################
# [[ $# -lt 2 ]] && error
#
# OPTS=$(getopt -o o:a:f:h --long os-family:,architecture:,file-type:,help -n 'parse-options' -- "$@")
#
# if [ $? != 0 ] ; then
#   echo "Failed parsing options." >&2
#   usage
# fi
#
# echo "$OPTS"
# eval set -- "$OPTS"
#
# while true; do
#     case "$1" in
#         -o | --os-family) OS_FAMILY=$2; shift; shift;;
#         -a | --architecture) ARCHI=$2; shift; shift;;
#         -f | --file-type) FILE_TYPE=$2; shift; shift;;
#         -h | --help) usage; shift;;
#         -- ) shift; break ;;
#         *) error;;
#     esac
# done

for i in "$@"
  do
    case $i in
        -o=* | --os-family=*)      OS_FAMILY="${i#*=}"     ;;
        -a=* | --architecture=*)   ARCHI="${i#*=}"         ;;
        -f=* | --file-type=*)      FILE_TYPE="${i#*=}"     ;;
        -h | --help)           usage                   ;;
        *)                     error                   ;;
    esac
done

FILE_TYPE=$(echo $FILE_TYPE | sed -e "s/\./\\\./")

URL=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html | \
    awk "/downloads\['/ && ! /demos/ && /\['files'\]/ && /${OS_FAMILY}-${ARCHI}/ && /\.${FILE_TYPE}/" | \
    grep -o "http.*\.${FILE_TYPE}")
# URL=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html | \
#     awk "/downloads\['/ && ! /demos/ && /\['files'\]/ && /linux-x64/ && /\.tar\.gz/" | \
#     grep -o 'http.*\.tar\.gz')

echo $URL
