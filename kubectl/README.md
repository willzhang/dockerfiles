## Running commands

```
docker run -it --rm willdockerhub/kubectl version
docker run -it --rm willdockerhub/kubectl get pods
```

## Loading your own configuration
```
docker run -it --rm  -v /path/to/your/kube/config:/.kube/config willdockerhub/kubectl apply -f deployment.yaml
```
