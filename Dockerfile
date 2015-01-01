
#
# io 2013.12.04
#
# VERSION 0.0.1
#

FROM ubuntu:14.04
MAINTAINER Marcus André <hello@marcusandre.de>

#
# Pkg
#

ENV SRC https://github.com/stevedekorte/io.git
ENV TAG 2013.12.04

#
# System
#

RUN apt-get update -qq
RUN apt-get install -qqy --force-yes build-essential git cmake

#
# Pull io
#

WORKDIR /tmp/io
RUN git clone $SRC . && git checkout $TAG
RUN ldconfig && mkdir build && cd build && cmake .. && make install
RUN rm -fr /tmp/io

#
# Entry
#

WORKDIR /
CMD ["io"]
