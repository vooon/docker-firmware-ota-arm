# -*- dockerfile -*-
# vim:ts=2 sw=2 et:

FROM ubuntu:xenial
MAINTAINER Vladimir Ermakov <vooon341@gmail.com>

ENV GCCARM_VERSION 6-2017-q2-update
ENV GCCARM_URL https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2?revision=2cc92fb5-3e0e-402d-9197-bdfc8224d8a5?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,6-2017-q2-update
ENV PATH "$PATH:/opt/gcc-arm-none-eabi-${GCCARM_VERSION}/bin"

# base deps
RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    make \
    python3-setuptools \
    python3-pip \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libc6-i386 \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    curl \
  && rm -rf /var/lib/apt/lists/*

# python modules
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# arm-none-eabi toolchain
RUN curl -SL "$GCCARM_URL" -o toolchain.tar.bz2 \
  && tar -C /opt -xf toolchain.tar.bz2 \
  && rm -f toolchain.tar.bz2
