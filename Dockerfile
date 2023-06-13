FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    automake \
    autotools-dev \
    fuse \
    git \
    libcurl4-gnutls-dev \
    libfuse-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pkg-config \
    vim
