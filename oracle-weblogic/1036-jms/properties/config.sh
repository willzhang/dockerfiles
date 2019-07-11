#!/bin/bash
export ADMIN_NAME=AdminServer
export DOMAIN_HOME=/root/Oracle/Middleware/user_projects/domains/base_domain/
export ADMIN_USERNAME=weblogic
export ADMIN_PASSWORD=88888888
export LISTEN_ADDRESS=0.0.0.0
export LISTEN_PORT=7002

#config java memory
export USER_MEM_ARGS="-Xms1g -Xmx2g -XX:PermSize=256m -XX:MaxPermSize=512m"