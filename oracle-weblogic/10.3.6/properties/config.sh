#!/bin/bash

#export weblogic variable(if unchanged,the default config must be as follows)
export ADMIN_USERNAME=weblogic
export ADMIN_PASSWORD=88888888
export LISTEN_ADDRESS=0.0.0.0
export LISTEN_PORT=6002
export DATASOURCE_NAME=chinainsuranceDataSource
export JNDI_NAME=chinainsuranceDataSource
export DRIVER_NAME=oracle.jdbc.OracleDriver
export DS_USERNAME=xxx
export DS_PASSWORD=xxx
export DS_HOST=10.0.105.114:3526:TPI3HX19

#config java memory
export USER_MEM_ARGS="-Xms1g -Xmx2g -XX:PermSize=256m -XX:MaxPermSize=512m"

#turnoff sso
#export SSO_PATH=/root/Oracle/Middleware/user_projects/domains/base_domain/autodeploy/webapps/WEB-INF
#cp -f /config/weblogic/app-config-acegi-security-dev.xml $SSO_PATH/app-config-acegi-security.xml
#cp -f /config/weblogic/6002-core/env.properties $SSO_PATH/classes/
