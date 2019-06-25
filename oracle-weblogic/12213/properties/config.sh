#!/bin/bash
export DOMIAN_NAME=base_domain
export ADMIN_NAME=AdminServer
export ADMIN_LISTEN_PORT=7001
export PRODUCTION_MODE=dev
ADMIN_USERNAME=weblogic
ADMIN_PASSWORD=88888888

#create domain.properties file
cat > /u01/oracle/properties/domain.properties << EOF
username=$ADMIN_USERNAME
password=$ADMIN_PASSWORD
EOF

#replace configfile
CONFIG_DIR=$(dirname "$CONFIG_FILE")
