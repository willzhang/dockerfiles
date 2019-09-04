#!/bin/bash
docker run -d --name bookstack \
  --restart always \
  -p 8181:8181 \
  willdockerhub/bookstack


