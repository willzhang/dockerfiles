# docker-alpine-curl
Alpine-based image with just curl

## Usage

```shell
docker run -it --rm willdockerhub/alpine-curl curl -fsSL https://www.google.com/
docker run -it --rm willdockerhub/alpine-curl curl -fsSL https://www.google.com/ > google.html

#download package to localhost
docker run -it -v $PWD:/root: --rm willdockerhub/alpine-curl curl -fsSL https://get.docker.com -o get-docker.sh
```

## Tags

* `willdockerhub/alpne-curl:latest  based on alpine:latest`