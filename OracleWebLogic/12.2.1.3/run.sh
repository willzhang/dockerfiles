#!/bin/bash
docker stop 12213-generic
docker rm 12213-generic
docker run -it --name=12213-generic -p 7002:7001 -p 9003:9002 \
	--user root -v /data/weblogic:/u01/oracle/properties \
	-e ADMINISTRATION_PORT_ENABLED=false \
        -e DOMAIN_NAME=base_domain \
        oracle/weblogic:12.2.1.3-generic bash
#docker logs -f 12213-generic
