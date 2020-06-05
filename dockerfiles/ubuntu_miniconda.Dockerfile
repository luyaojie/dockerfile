FROM ubuntu:latest

LABEL maintainer="Yaojie Lu <yaojie.lu@outlook.com>"

# 替换阿里云更新源
COPY /source/ubuntu18.04_aliyun.source.list /etc/apt/sources.list

# 安装常用软件
RUN apt-get update --fix-missing && apt-get install -y \
    wget \
    g++ \
    git \
    make \
    libdpkg-perl \
    sudo \
    vim \
    unzip \
    unrar \
    openssh-server \
    psmisc \
    --no-install-recommends

# 安装 miniconda
RUN wget -nv --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH /opt/conda/bin:${PATH}

RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple && \
    pip config set global.trusted-host mirrors.aliyun.com

RUN pip install --upgrade pip && \
    pip install torch torchvision && \
    pip install ipython
