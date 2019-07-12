#!/bin/bash
docker build -t willdockerhub/git-lfs:v2.0 -f Dockerfile-alpine .
docker push willdockerhub/git-lfs:v2.0
