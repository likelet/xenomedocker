FROM ubuntu:16.04

LABEL software="Xenome"
LABEL software.version="1.0"

RUN apt-get update && apt-get install -y \
  bzip2 \
  g++ \
  make \
  ncurses-dev \
  wget \
  zlib1g-dev \
  cmake \
  libboost-all-dev \
  pandoc \
  zlib1g-dev \
  libbz2-dev \
  libsqlite3-dev \
  unzip \
  git \
  git-core

RUN apt-get install -y --no-install-recommends libnss-sss


ENV GOSSAMER_INSTALL_DIR=/data/gossamer/build/

WORKDIR /data
RUN git clone https://github.com/data61/gossamer

WORKDIR /data/gossamer
RUN mkdir build

WORKDIR /data/gossamer/build
RUN cmake ..
RUN make
RUN make install

RUN ln -s $GOSSAMER_INSTALL_DIR/src/xenome /usr/bin/xenome
RUN ln -s $GOSSAMER_INSTALL_DIR/src/gossple /usr/bin/gossple
RUN ln -s $GOSSAMER_INSTALL_DIR/src/goss /usr/bin/goss
RUN ln -s $GOSSAMER_INSTALL_DIR/src/electus /usr/bin/electus
