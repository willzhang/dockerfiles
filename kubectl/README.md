## What is Kubectl?

Kubectl is the Kubernetes command line interface.

## Supported tags and respective Dockerfile links

based with alpine:latest

* [latest](https://github.com/willzhang/docker-images/blob/master/kubectl/Dockerfile)


## How to use this image

```
docker run -it --rm willdockerhub/kubectl
docker run -it --rm willdockerhub/kubectl --help
docker run -it --rm willdockerhub/kubectl version
```

## Loading your own configuration
```
docker run -it --rm  -v /path/to/your/kube/config:/.kube/config willdockerhub/kubectl apply -f deployment.yaml

docker run -it --rm  -v /path/to/your/kube/config:/.kube/config willdockerhub/kubectl get pods
```
