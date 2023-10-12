FROM ubuntu:20.04

COPY startup.sh /startup.sh

RUN apt-get update \
    && apt-get install -qq -y --no-install-recommends \
        git \
        wget \
        g++ \
        gcc \
        autoconf \
        make \
        zip \
        unzip \
        file \
        ca-certificates \
        libfreetype6-dev \
        libcups2-dev \
        libx11-dev \
        libxext-dev \
        libxrender-dev \
        libxrandr-dev \
        libasound2-dev \
        libffi-dev \
        libxt-dev \
        libxtst-dev \
        libfontconfig-dev \
    && apt-get clean -y \ 
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/local/lib/bootjdk \
    && wget -q https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz \
    && tar xzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz -C /usr/local/lib/bootjdk --strip-components=1 \
    && rm OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz \
    && ln -sf /usr/local/lib/bootjdk/bin/java /usr/bin/java \
    && ln -sf /usr/local/lib/bootjdk/bin/javac /usr/bin/javac \
    && ln -sf /usr/local/lib/bootjdk/bin/keytool /usr/bin/keytool \
    && chmod 744 /startup.sh

CMD /startup.sh