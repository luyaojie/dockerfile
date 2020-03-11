FROM ubuntu:latest
LABEL maintainer="Yaojie Lu <yaojie.lu@outlook.com>"

COPY /source/ubuntu18.04_aliyun.source.list /etc/apt/sources.list

RUN apt-get update --fix-missing && apt-get install -y \
    wget \
    g++ \
    git \
    make \
    libdpkg-perl \
    vim \
    --no-install-recommends

RUN wget --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH /opt/conda/bin:${PATH}

COPY /source/pyltp.tar.gz /opt/pyltp/

WORKDIR /opt/pyltp/

RUN tar zxvf pyltp.tar.gz && \
    cd pyltp && \
    python setup.py install && \
    pip install gevent flask_cors

WORKDIR /root
