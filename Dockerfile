FROM      ubuntu:trusty
MAINTAINER Dan Porter <dan.porter@rehabstudio.com>

# Get all required packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        fontforge wget tar build-essential \
        openjdk-7-jdk \
        git \
        unzip zlib1g-dev \
        libqt4-core libqt4-dev libqt4-gui qt4-dev-tools \
        libfreetype6-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Build everything
RUN mkdir -p /build && \
    \
    echo "ttf2eot build" && \
    cd /build && wget --no-check-certificate https://ttf2eot.googlecode.com/files/ttf2eot-0.0.2-2.tar.gz && \
    tar zxvf ttf2eot-0.0.2-2.tar.gz && \
    sed -i.bak "/using std::vector;/ i\#include <cstddef>" /build/ttf2eot-0.0.2-2/OpenTypeUtilities.h && \
    cd /build/ttf2eot-0.0.2-2 && make && cp ttf2eot /usr/local/bin/ttf2eot && \
    \
    echo "woff build" && \
    cd /build && wget http://people.mozilla.org/~jkew/woff/woff-code-latest.zip && \
    unzip -d woff-code-latest woff-code-latest.zip && \
    cd /build/woff-code-latest && make && cp sfnt2woff /usr/local/bin/sfnt2woff && \
    \
    echo "ttfautohint build" && \
    cd /build && wget http://downloads.sourceforge.net/project/freetype/ttfautohint/0.97/ttfautohint-0.97.tar.gz && \
    tar zxvf ttfautohint-0.97.tar.gz && \
    cd /build/ttfautohint-0.97 && ./configure --without-doc && make install && \
    cd / && rm -rf /build

## CSS3FontConverter
RUN git clone https://github.com/zoltan-dulac/css3FontConverter /app && mkdir -p /fonts

WORKDIR /fonts

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
