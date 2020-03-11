#!/usr/bin/env bash
# -*- coding:utf-8 -*-

# 生成 CUDA + miniconda 的 Image, 名为 cuda_miniconda
docker build --rm -f "cuda_miniconda.Dockerfile" -t cuda_miniconda:latest "."

# 生成 Allennlp + Transformers 的 Image, 名为 allennlp_transformers
docker build --rm -f "allennlp_transformers.Dockerfile" -t allennlp_transformers:latest "."

# 生成 Ubuntu + miniconda 的 Image, 名为 ubuntu_miniconda
docker build --rm -f "ubuntu_miniconda.Dockerfile" -t ubuntu_miniconda:latest "."