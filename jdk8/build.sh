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
docker pull tabatad/jdk8:latest
docker run -itd --name jdk8 --env JDK_SOURCE=$JDK_SOURCE tabatad/jdk8:latest
docker cp ./src/$JDK_SOURE jdk8:/
docker exec jdk8 /startup.sh
docker cp jdk8:/src/$JDK_SOURCE/build/linux-x86_64-normal-server-release/images/j2sdk-image build/
docker stop jdk8
docker rm jdk8
