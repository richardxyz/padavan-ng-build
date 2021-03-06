FROM ubuntu:xenial

MAINTAINER Richard Xie

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
	&& apt-get install -qy apt-utils \
	&& apt-get -qy install locales \
	&& locale-gen --no-purge en_US.UTF-8 \
	&& apt-get install -qy \
	git \
	build-essential \
	gawk \
	pkg-config \
	gettext \
	automake \
	autoconf \
	autopoint \
	libtool \
	bison \
	flex \
	zlib1g-dev \
	libgmp3-dev \
	libmpfr-dev \
	libmpc-dev \
	texinfo \
	mc \
	libncurses5-dev \
	nano \
	vim \
  	autopoint \
	gperf \
	python-docutils \	
	sudo \
	module-init-tools \
	wget \
	bsdtar \
  	unzip \
	help2man libtool-bin \
	&& mkdir -p /home/rt-n56u/toolchain-mipsel \
  	&& cd /opt \
  	&& wget --no-check-certificate https://gitlab.com/dm38/padavan-ng/-/archive/master/padavan-ng-master.zip -O padavan-ng.zip \
  	&& unzip padavan-ng.zip \
	&& cd /opt/padavan-ng-master/toolchain \
	&& ./clean_sources.sh \
	&& ./build_toolchain.sh \
 	&& ls -l /opt/padavan-ng-master/toolchain 

#	&& mv toolchain-3.4.x /home/rt-n56u/toolchain-mipsel/ \
#	&& cd /opt && rm -rf /opt/rt-n56u
	
WORKDIR /opt

CMD ["/bin/bash"]
