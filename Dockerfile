FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    automake \
    sudo \
    jq \
    autotools-dev \
    fuse \
    g++ \
    curl \
    unzip \
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
RUN curl -LO https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb&&dpkg -i packages-microsoft-prod.deb
RUN apt install libfuse3-dev fuse3 -y
RUN apt-get update
RUN apt install blobfuse2 -y
RUN sudo apt-get install apt-transport-https ca-certificates gnupg -y
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
RUN sudo apt-get update && sudo apt-get install google-cloud-cli -y
RUN gcloud init
RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s `
RUN echo "deb https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN sudo apt-get install fuse gcsfuse
RUN gcsfuse -v
    

