cd "$(dirname "$0")"
rm -rf build
mkdir build
docker pull tabatad/jdk11:latest
docker run --name jdk11 tabatad/jdk11:latest
docker cp jdk11:/jdk11u-dev/build/linux-x86_64-normal-server-release/images/jdk build/
docker stop jdk11
docker rm jdk11
