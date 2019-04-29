#!/bin/bash
docker stop 12213-generic
docker rm 12213-generic
docker run -itd --name=12213-generic --restart always -p 7001:7001 \
           -e CONFIG_FILE=/config/config.sh \
	   -v /data/weblogic:/config oracle/weblogic:12.2.1.3-generic
