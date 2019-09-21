# docker-alpine-curl
Alpine-based image with just curl

## Usage

```shell
docker run -it --rm willdockerhub/alpine-curl curl curl -fsSL https://www.google.com/
docker run -it --rm willdockerhub/alpine-curl curl curl -fsSL https://www.google.com/ > google.html

#download to localhost
docker run -it -v $PWD:/root: --rm willdockerhub/alpine-curl curl -O https://raw.githubusercontent.com/willzhang/shell/master/install_docker.sh
```

## Tags

* `willdockerhub/alpne-curl:latest  based on alpine:latest`