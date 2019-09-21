## docker image for curl wget ssh git
based on alpine:latest

## Usage
curl
```shell
docker run -it --rm willdockerhub/curl-wget \
curl -fsSL https://www.google.com/

docker run -it --rm willdockerhub/curl-wget \
curl -fsSL https://www.google.com/ > google.html

#download package to localhost
docker run -it -v $PWD:/root: --rm willdockerhub/curl-wget \
curl -fsSL https://get.docker.com -o get-docker.sh
```
wget
```
docker run -it --rm willdockerhub/curl-wget \
wget https://www.google.com/

docker run -it --rm willdockerhub/curl-wget \
wget https://www.google.com/ > google.html

#download package to localhost
docker run -it -v $PWD:/root: --rm willdockerhub/curl-wget \
wget -O get-docker.sh https://get.docker.com 
```

git
```
 docker run -it -v $PWD:/root: --rm willdockerhub/curl-wget \
 git clone https://github.com/freeCodeCamp/freeCodeCamp.git
```
ssh
```
docker run -it -v $PWD:/root: --rm willdockerhub/curl-wget ssh \
192.168.1.1
```