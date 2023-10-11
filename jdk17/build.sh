cd "$(dirname "$0")"
rm -rf build
mkdir build
docker pull tabatad/jdk17:latest
docker run --name jdk17 tabatad/jdk17:latest
docker cp jdk17:/jdk17u-dev/build/linux-x86_64-server-release/images/jdk build/
docker stop jdk17
docker rm jdk17
