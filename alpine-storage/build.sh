#!/bin/bash
TAG=jdk1.6
DOCKERFILE=Dockerfile-$TAG
docker build -t willdockerhub/alpine-storage:$TAG -f $DOCKERFILE .
docker push willdockerhub/alpine-storage:$TAG
