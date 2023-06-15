FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    automake \
    sudo \
    autotools-dev \
    fuse \
    g++ \
    curl \
    git \
    libcurl4-gnutls-dev \
    libfuse-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pkg-config \
    vim
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git    
RUN cd s3fs-fuse&&./autogen.sh&&./configure --prefix=/usr --with-openssl&&make&&make install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"&&unzip awscliv2.zip&&sudo ./aws/install

