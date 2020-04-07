FROM docker.io/nvidia/cuda:10.1-cudnn7-devel

LABEL maintainer="Yaojie Lu <yaojie.lu@outlook.com>"

# 删除原有 apt 中和 CUDA 相关的 source，经常会连接不上
RUN rm /etc/apt/sources.list.d/cuda.list /etc/apt/sources.list.d/nvidia-ml.list

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
    pip install gpustat

RUN echo "Installing Apex on top of ${BASE_IMAGE}"

WORKDIR /tmp/unique_for_apex
RUN SHA=ToUcHMe git clone https://github.com/NVIDIA/apex.git
WORKDIR /tmp/unique_for_apex/apex
RUN pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .

WORKDIR /root
