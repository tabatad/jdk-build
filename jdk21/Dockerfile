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
    && wget -q https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz \
    && tar xzf jdk-21_linux-x64_bin.tar.gz -C /usr/local/lib/bootjdk --strip-components=1 \
    && rm jdk-21_linux-x64_bin.tar.gz \
    && ln -sf /usr/local/lib/bootjdk/bin/java /usr/bin/java \
    && ln -sf /usr/local/lib/bootjdk/bin/javac /usr/bin/javac \
    && ln -sf /usr/local/lib/bootjdk/bin/keytool /usr/bin/keytool \
    && chmod 744 /startup.sh
