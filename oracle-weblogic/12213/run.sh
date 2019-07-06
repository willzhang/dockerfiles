#!/bin/bash
docker stop weblogic12213
docker rm weblogic12213
docker run -itd --name=weblogic12213 --restart always -p 7001:7001 \
           -e CONFIG_FILE=/data/config/config.sh \
	   -v /data/config:/data/config \
           willdockerhub/oralce-weblogic:12213
