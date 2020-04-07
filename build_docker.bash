#!/usr/bin/env bash
# -*- coding:utf-8 -*-

# 生成 CUDA + miniconda 的 Image, 名为 cuda_miniconda
docker build --rm -f "dockerfiles/cuda_miniconda.Dockerfile" -t cuda_miniconda:latest "."

# 生成 CUDA + miniconda + apex 的 Image, 名为 cuda_miniconda_apex
docker build --rm -f "dockerfiles/cuda_miniconda_apex.Dockerfile" -t cuda_miniconda_apex:latest "."

# 生成 Allennlp + Transformers 的 Image, 名为 allennlp_transformers
docker build --rm -f "dockerfiles/allennlp_transformers.Dockerfile" -t allennlp_transformers:latest "."

# 生成 Ubuntu + miniconda 的 Image, 名为 ubuntu_miniconda
docker build --rm -f "dockerfiles/ubuntu_miniconda.Dockerfile" -t ubuntu_miniconda:latest "."

# 生成 PyLTP 的 Image, 名为 pyltp
docker build --rm -f "dockerfiles/pyltp.Dockerfile" -t pyltp:latest "."
