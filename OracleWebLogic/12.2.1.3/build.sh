#!/bin/bash

IMAGE_NAME="oracle/weblogic:12.2.1.3-generic"
NOCACHE=true
docker build --force-rm=$NOCACHE --no-cache=$NOCACHE -t $IMAGE_NAME -f Dockerfile.generic
