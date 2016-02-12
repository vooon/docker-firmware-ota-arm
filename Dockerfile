FROM ubuntu
MAINTAINER Vladimir Ermakov <vooon341@gmail.com>

ENV OTAMKFW_TAG 0.1.2
ENV OTAMKFW_URL https://github.com/vooon/ota-mkfw/archive

ENV GCCARM_VER 5_2-2015q4
ENV GCCARM_URL https://launchpad.net/gcc-arm-embedded/5.0/5-2015-q4-major/+download/gcc-arm-none-eabi-5_2-2015q4-20151219-linux.tar.bz2

# base deps
RUN apt-get update && apt-get install -y \
	build-essential \
	git \
	make \
	python-dateutil \
	python-setuptools \
	python-pip \
	python-dev \
	libffi-dev \
	libssl-dev \
	wget

# ota-mkfw
RUN pip install ${OTAMKFW_URL}/${OTAMKFW_TAG}.tar.gz

# arm-none-eabi toolchain
RUN wget ${GCCARM_URL} -O gcc-arm-none-eabi.tar.bz2 && \
	tar xvf gcc-arm-none-eabi.tar.bz2 && \
	rm -f gcc-arm-none-eabi.tar.bz2 && \
	ln -s gcc-arm-none-eabi-${GCCARM_VER} /opt/arm-toolchain

# cleanup
RUN apt-get clean && \
	rm -rf /var/lib/apt
