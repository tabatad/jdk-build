#!/bin/bash

if [ "$1" = "" ]
then
    echo "You need to specify the location of the JDK source"
    exit 1
fi

JDK_SOURCE=$1

if [ ! -d src/$JDK_SOURCE ]
then 
    echo "$JDK_SOURCE not found"
    exit 1
fi

# clean up
rm -rf build
mkdir build

# build
docker pull tabatad/jdk11:latest
docker run -itd --name jdk11 --env JDK_SOURCE=$JDK_SOURCE tabatad/jdk11:latest
docker cp ./src/$JDK_SOURE jdk11:/
docker exec jdk11 /startup.sh
docker cp jdk11:/src/$JDK_SOURCE/build/linux-x86_64-normal-server-release/images/jdk build/
docker stop jdk11
docker rm jdk11
