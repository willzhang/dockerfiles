#!/bin/bash
TAG=jdk1.7
DOCKERFILE=Dockerfile-$TAG
docker build -t willdockerhub/alpine-storage:$TAG -f $DOCKERFILE .
docker push willdockerhub/alpine-storage:$TAG
