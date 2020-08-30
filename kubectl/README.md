## Running commands

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
