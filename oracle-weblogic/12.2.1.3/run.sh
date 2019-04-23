#!/bin/bash
docker stop 12213-generic
docker rm 12213-generic
docker run -itd --name=12213-generic --restart always -p 7001:7001 -p 9002:9002 \
	--user root -v /data/weblogic:/u01/oracle/properties \
	-e ADMINISTRATION_PORT_ENABLED=false \
        -e DOMAIN_NAME=base_domain \
        oracle/weblogic:12.2.1.3-generic #bash
