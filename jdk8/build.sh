cd "$(dirname "$0")"
rm -rf build
mkdir build
docker pull tabatad/jdk8:latest
docker run --name jdk8 tabatad/jdk8:latest
docker cp jdk8:/jdk8u-dev/build/linux-x86_64-normal-server-release/images/j2sdk-image build/
docker stop jdk8
docker rm jdk8
