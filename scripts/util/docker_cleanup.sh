#!/usr/bin/env bash


#############################################
## Global variables
#############################################
BASE_DIR=$(dirname $0)
HUB_DIR="$(cd $BASE_DIR/../.. && pwd -P)"
echo "${green} HUB_DIR: $HUB_DIR ${reset}"


FULL_CLEANUP=


#############################################
## Functions
#############################################


usage() {
  echo "Usage: $0 [options]"
  echo ""
  echo "${blue}Options:    ${reset}"
  echo "${blue}          -f, --full-cleanup         full cleanup including containers, images and volumes ${reset}"
  echo "${blue}          -h,  --help                help ${reset}"
  echo "${blue}                                          ${reset}"
  echo "${blue}By default, this will clean stop all containers and destroy them, remove all untagged and stagging images and all stagging volumes ${reset}"
  exit 1
}

cleanContainers() {
    containers=$(docker ps -q)
    if [ "$containers" != "" ]; then
        echo "killing all containers"
        docker kill $(docker ps -q)
    else
       echo "there is no running container"
    fi

    containers=$(docker ps -aq)
    if [ "$containers" != "" ]; then
        echo "removing all containers"
        docker rm -f $(docker ps -a -q)
    else
       echo "there is no container"
    fi
}

cleanImages() {
    if [ "$FULL_CLEANUP" == "true" ]; then
        images=$(docker images -q)
        if [ "$images" != "" ]; then
            echo "removing all images"
            docker rmi $(docker images -q)
        else
            echo "there is no image to be removed"
        fi
    else
        images=$(docker images -q -f dangling=true)
        if [ "$images" != "" ]; then
            echo "removing all dangling images"
            docker rmi $(docker images -q -f dangling=true)
        else
           echo "there is no dangling image to be removed"
        fi
    fi
}

cleanVolumes() {
    if [ "$FULL_CLEANUP" == "true" ]; then
        volumes=$(docker volume ls -qf)
        if [ "$volumes" != "" ]; then
            echo "removing all volumes"
            docker volume ls -qf | xargs -r docker volume rm
        else
           echo "there is no volume to be remove"
        fi
    else
        volumes=$(docker volume ls -qf dangling=true)
        if [ "$volumes" != "" ]; then
            echo "removing all dangling volumes"
            docker volume ls -qf dangling=true | xargs -r docker volume rm
        else
           echo "there is no dangling volume to be removed"
        fi
    fi
}


#############################################
## Check arguments
#############################################
for i in "$@"
  do
    case $i in
      -f|--full-cleanup)       EVERYTHING="true"       ;;
      -h|--help)                   usage               ;;
      *)                           usage               ;;
    esac
done


#############################################
## Run
#############################################

cleanContainers
cleanImages
cleanVolumes
