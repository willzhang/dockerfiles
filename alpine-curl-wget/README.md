# docker image alpine-curl-wget
Alpine-based image with just curl wget

## Usage
curl
```shell
docker run -it --rm willdockerhub/alpine-curl curl -fsSL https://www.google.com/
docker run -it --rm willdockerhub/alpine-curl curl -fsSL https://www.google.com/ > google.html

#download package to localhost
docker run -it -v $PWD:/root: --rm willdockerhub/alpine-curl curl -fsSL https://get.docker.com -o get-docker.sh
```
wget
```
docker run -it --rm willdockerhub/alpine-curl wget https://www.google.com/
docker run -it --rm willdockerhub/alpine-curl wget https://www.google.com/ > google.html

#download package to localhost
docker run -it -v $PWD:/root: --rm willdockerhub/alpine-curl wget -O get-docker.sh https://get.docker.com 
```

## Tags

* `willdockerhub/alpne-curl-wget:latest    based on alpine:latest`