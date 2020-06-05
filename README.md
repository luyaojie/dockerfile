# 深度学习相关常用 Docker 构建

## 项目结构说明

```text
.
├── build_docker.bash   构建本仓库中所有的 docker
├── dockerfiles/        dockerfile
├── run_docker.bash     运行 Docker 命令样例
└── source/             可替换文件，如 Ubuntu 更新源信息
```

## dockerfiles 说明
| Docker | 说明 |
|---|---|
| allennlp_transformers.Dockerfile | 安装 Allennlp + Transformers, 以 cuda_miniconda 为基础 |
| cuda_miniconda.Dockerfile | 安装 cuda + miniconda 环境 |
| cuda_miniconda_apex.Dockerfile | 安装 cuda + miniconda + apex 环境 |
| pyltp.Dockerfile | 安装 pyltp 环境 |
| ubuntu_miniconda.Dockerfile | 安装 ubuntu + miniconda 环境, 用于只使用 CPU 环境 |
