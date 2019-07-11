

```
FROM debian:stretch-slim
LABEL maintainer="stewmcc@gmail.com"

RUN \
  apt-get update && \
  apt-get install -y sudo curl git && \
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
  sudo apt-get install git-lfs
```













https://github.com/SimSimY/git-lfs

https://github.com/StewMcc/docker-git-lfs/blob/master/Dockerfile

https://github.com/git-lfs/git-lfs/wiki/Installation

https://github.com/jgpelaez/docker-git-lfs/blob/master/Dockerfile
