#!/bin/bash

#export weblogic variable
export ADMIN_NAME=AdminServer
export DOMAIN_HOME=/root/Oracle/Middleware/user_projects/domains/base_domain/
export ADMIN_URL=t3://127.0.0.1:7001
export ADMIN_USERNAME=weblogic
export ADMIN_PASSWORD=88888888
export LISTEN_ADDRESS=0.0.0.0
export LISTEN_PORT=7001

#config java memory
export USER_MEM_ARGS="-Xms1g -Xmx2g -XX:PermSize=256m -XX:MaxPermSize=512m"

#turnoff sso
#export SSO_PATH=/root/Oracle/Middleware/user_projects/domains/base_domain/autodeploy/webapps/WEB-INF
#cp -f /config/weblogic/app-config-acegi-security-dev.xml $SSO_PATH/app-config-acegi-security.xml
#cp -f /config/weblogic/6002-core/env.properties $SSO_PATH/classes/
