FROM cuda_miniconda:latest

LABEL maintainer="Yaojie Lu <yaojie.lu@outlook.com>"

RUN pip install allennlp==0.9.0 transformers==2.4.1
