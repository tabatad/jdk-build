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
docker pull tabatad/jdk21:latest
docker run -itd --name jdk21 --env JDK_SOURCE=$JDK_SOURCE tabatad/jdk21:latest
docker cp ./src/$JDK_SOURE jdk21:/
docker exec jdk21 /startup.sh
docker cp jdk21:/src/$JDK_SOURCE/build/linux-x86_64-server-release/images/jdk build/
docker stop jdk21
docker rm jdk21
