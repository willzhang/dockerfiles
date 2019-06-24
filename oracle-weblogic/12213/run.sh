#!/bin/bash
docker stop weblogic-12213
docker rm weblogic-12213
docker run -itd --name=weblogic-12213 --restart always -p 7001:7001 \
           -e CONFIG_FILE=/config/config.sh \
	   -v /data/config:/config willdockerhub/oralce-weblogic:12213
