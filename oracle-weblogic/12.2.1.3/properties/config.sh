#!/bin/bash
export DOMIAN_NAME=base_domain
export ADMIN_NAME=AdminServer
export ADMIN_LISTEN_PORT=6901
export PRODUCTION_MODE=dev
export DSNAME=chinainsuranceDataSource
export DSDBNAME=dedicated;create=true
export DSJNDINAME=chinainsuranceDataSource
export DSDRIVER=oracle.jdbc.OracleDriver
export DB_HOST=10.0.105.114:3526:TPI3hx19
export DS_USERNAME=xxx
export DS_PASSWORD=xxx

#copy weblogic username and password
cp /config/weblogic/cas-admin/domain.properties /u01/oracle/properties/

#copy admin app config
#DEPLOY_PATH=/u01/oracle/user_projects/domains/base_domain/autodeploy/casAdmin/
#cp -f /config/weblogic/cas-admin/application.yml $DEPLOY_PATH/WEB-INF/classes/
#cp -f /config/weblogic/cas-admin/logback-spring.xml $DEPLOY_PATH/WEB-INF/classes/
