## what is this image

latest verison helm based on alpine:latest

## Supported tags and respective Dockerfile links


* [latest](https://github.com/willzhang/docker-images/blob/master/helm/Dockerfile)


## How to use this image

```
docker run -it --rm willdockerhub/helm --help
docker run -it --rm willdockerhub/helm version
docker run -it --rm --entrypoint="" willdockerhub/helm sh
```

## Loading your own configuration
```
docker run -it --rm  -v /path/to/your/kube/config:/.kube/config willdockerhub/kubectl apply -f deployment.yaml

docker run -it --rm  -v /path/to/your/kube/config:/.kube/config willdockerhub/kubectl get pods
```
