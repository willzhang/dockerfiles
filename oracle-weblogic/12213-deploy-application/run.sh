#!/bin/bash
docker stop sample-app
docker rm sample-app
docker run -it -d --name sample-app \
	-p 7001:7001 \
	-e PRODUCTION_MODE=dev \
        -e ADMINISTRATION_PORT_ENABLED=false \
	-v /data/properties:/u01/oracle/properties \
	sample-app:v1.0
