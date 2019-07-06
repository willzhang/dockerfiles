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
    wlst.sh -loadProperties domain.properties -skipWLSModuleScanning /root/Oracle/create-wls-domain.py
fi

# create datasource
CONFIG_PATH=$(dirname "$CONFIG_FILE")
DATASOURCE_PATH=$CONFIG_PATH/datasource/
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

#create jms
wlst.sh /root/Oracle/jms-deploy.py

# start weblogic
/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh

