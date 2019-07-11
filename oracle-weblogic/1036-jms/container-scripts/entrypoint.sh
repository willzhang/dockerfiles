#!/bin/bash

# define configfile env from wisecloud ui
if [ $CONFIG_FILE ]
then
  chmod +x $CONFIG_FILE && source $CONFIG_FILE
else
  echo "No env configuration file provided,skip!"
fi

# create weblogic domain
startfile="/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh"

if [ ! -f "$startfile" ] 
then
    wlst.sh -skipWLSModuleScanning /root/Oracle/create-wls-domain.py
fi

# create datasource
DATASOURCE_PATH=$(dirname "$CONFIG_FILE")/datasource/
if [ -d "$DATASOURCE_PATH" ]
then 
  for properties in $(ls $DATASOURCE_PATH)
  do
     wlst.sh -loadProperties $DATASOURCE_PATH$properties /root/Oracle/ds-deploy.py
     echo "create datasource $properties success!"
  done
else
  echo "No datasource.properties file provided,skip to create datasource!"
fi

# start weblogic
/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh &

echo 'Waiting for Admin Server to reach RUNNING state'
sleep 60s

# create jms server
JMS_PATH=$(dirname "$CONFIG_FILE")/jms/
if [ -d "$JMS_PATH" ]
then
  for properties in $(ls $JMS_PATH)
  do
     cp $JMS_PATH$properties /root/Oracle/
     wlst.sh -loadProperties $JMS_PATH$properties /root/Oracle/jms-deploy.py
     echo "create jms $properties success!"
  done
else
  echo "No jms.properties file provided,skip to create jms!"
fi

sleep infinity
