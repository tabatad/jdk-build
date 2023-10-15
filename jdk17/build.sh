#!/bin/bash

if [ "$1" = "" ]
then
    echo "no argument"
    exit
fi

JDK_SOURCE=$1

# clean up
rm -rf build
mkdir build

# build
docker pull tabatad/jdk17:latest
docker run -itd --name jdk17 --env JDK_SOURCE=$JDK_SOURCE tabatad/jdk17:latest
docker cp ./src/$JDK_SOURE jdk17:/
docker exec jdk17 /startup.sh
docker cp jdk17:/src/$JDK_SOURCE/build/linux-x86_64-server-release/images/jdk build/
docker stop jdk17
docker rm jdk17
