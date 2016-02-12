FROM ubuntu
MAINTAINER Vladimir Ermakov <vooon341@gmail.com>

ENV OTAMKFW_TAG 0.1.2
ENV OTAMKFW_URL https://github.com/vooon/ota-mkfw/archive

ENV GCCARM_VER 4_9-2015q3
ENV GCCARM_URL https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2

# base deps
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install --no-install-recommends -y \
	build-essential \
	git \
	make \
	python-empy \
	python-dateutil \
	python-setuptools \
	python-pip \
	python-dev \
	libffi-dev \
	libssl-dev \
	libc6-i386 \
	libc6:i386 \
	libncurses5:i386 \
	libstdc++6:i386 \
	wget

# ota-mkfw
RUN pip install ${OTAMKFW_URL}/${OTAMKFW_TAG}.tar.gz

# arm-none-eabi toolchain
RUN wget ${GCCARM_URL} -O gcc-arm-none-eabi.tar.bz2 && \
	tar xvf gcc-arm-none-eabi.tar.bz2 -C /opt && \
	rm -f gcc-arm-none-eabi.tar.bz2 && \
	ln -s /opt/gcc-arm-none-eabi-${GCCARM_VER} /opt/arm-toolchain

# cleanup
RUN apt-get clean && \
	rm -rf /var/lib/apt