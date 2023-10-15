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
docker pull tabatad/jdk21:latest
docker run -itd --name jdk21 --env JDK_SOURCE=$JDK_SOURCE tabatad/jdk21:latest
docker cp ./src/$JDK_SOURE jdk21:/
docker exec jdk21 /startup.sh
docker cp jdk21:/src/$JDK_SOURCE/build/linux-x86_64-server-release/images/jdk build/
docker stop jdk21
docker rm jdk21
