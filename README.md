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

| Docker                           | 说明                                                   |
| -------------------------------- | ------------------------------------------------------ |
| allennlp_transformers.Dockerfile | 安装 Allennlp + Transformers, 以 cuda_miniconda 为基础 |
| cuda_miniconda.Dockerfile        | 安装 cuda + miniconda 环境                             |
| cuda_miniconda_apex.Dockerfile   | 安装 cuda + miniconda + apex 环境                      |
| pyltp.Dockerfile                 | 安装 pyltp 环境                                        |
| ubuntu_miniconda.Dockerfile      | 安装 ubuntu + miniconda 环境, 用于只使用 CPU 环境      |

## 构建 Docker

```bash
docker build --rm -f "dockerfiles/ubuntu_miniconda.Dockerfile" -t ubuntu_miniconda:latest "."
```

## 运行 Docker

使用镜像 cuda_miniconda:latest 以交互模式启动一个容器,在容器内执行 /bin/bash 命令。

```bash
docker run --gpus all -it \
  -v '/share/model:/share/model' \
  -p 8888:8888 \
  --name cuda_miniconda \
  cuda_miniconda:latest \
  /bin/bash
```

1. ``--gpus all`` 使 Docker 可见所有 GPU

2. ``-p 8888:8888`` 将 Docker 8888 映射到宿主机的 8888 端口

3. ``--name cuda_miniconda`` 运行容器的名称为 cuda_miniconda

4. ``cuda_miniconda`` 运行的镜像名称

5. ``-v '/share/model:/share/model'`` 绑定卷

6. ``/bin/bash`` 在容器内执行命令
