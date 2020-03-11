#!/usr/bin/env bash
# -*- coding:utf-8 -*-

docker run --gpus all -it \
  -v '/share/model:/share/model' \
  -p 8888:8888 \
  --name cuda_miniconda \
  cuda_miniconda \
  /bin/bash
