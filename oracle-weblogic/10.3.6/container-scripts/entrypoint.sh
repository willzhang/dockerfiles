#!/bin/bash

# define configfile env from wisecloud ui
chmod +x $CONFIG_FILE && source $CONFIG_FILE

# create weblogic domain and jdbc
startfile="/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh"

if [ ! -f "$startfile" ] 
then
    /root/Oracle/Middleware/wlserver_10.3/common/bin/wlst.sh -skipWLSModuleScanning /create-wls-domain.py
fi

# start weblogic
/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh

