cd "$(dirname "$0")"
rm -rf build
mkdir build
docker pull tabatad/jdk21:latest
docker run --name jdk21 tabatad/jdk21:latest
docker cp jdk21:/jdk21u/build/linux-x86_64-server-release/images/jdk build/
docker stop jdk21
docker rm jdk21
