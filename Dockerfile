FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    automake \
    autotools-dev \
    fuse \
    g++ \
    git \
    libcurl4-gnutls-dev \
    libfuse-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pkg-config \
    vim
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git    
RUN cd s3fs-fuse \
    ./autogen.sh \
    ./configure --prefix=/usr --with-openssl \
    make \
    make install \    
