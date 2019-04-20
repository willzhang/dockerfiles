#Copyright (c) 2014-2018 Oracle and/or its affiliates. All rights reserved.
#
#Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#
# WebLogic on Docker Default Domain
#
# Domain, as defined in DOMAIN_NAME, will be created in this script. Name defaults to 'base_domain'.
#
# Since : October, 2014
# Author: monica.riccelli@oracle.com
# ==============================================
import os

# Deployment Information for domian
domain_name  = os.environ.get("DOMAIN_NAME", "base_domain")
admin_name  = os.environ.get("ADMIN_NAME", "AdminServer")
admin_listen_port   = int(os.environ.get("ADMIN_LISTEN_PORT", "7001"))
domain_path  = '/u01/oracle/user_projects/domains/%s' % domain_name
production_mode = os.environ.get("PRODUCTION_MODE", "dev") #change to dev, default prod
administration_port_enabled = os.environ.get("ADMINISTRATION_PORT_ENABLED", "true")
administration_port = int(os.environ.get("ADMINISTRATION_PORT", "9002"))

print ""
print "Start creating WebLogic domain with below parameters:"
print('domain_name                 : [%s]' % domain_name);
print('admin_listen_port           : [%s]' % admin_listen_port);
print('domain_path                 : [%s]' % domain_path);
print('production_mode             : [%s]' % production_mode);
print('admin name                  : [%s]' % admin_name);
print('administration_port_enabled : [%s]' % administration_port_enabled);
print('administration_port         : [%s]' % administration_port);

# Deployment Information for datasource
dsname			= os.environ.get('DSNAME', 'chinainsuranceDataSource')
dsdbname		= os.environ.get('DSDBNAME', 'dedicated')
dsjndiname		= os.environ.get('DSJNDINAME', 'chinainsuranceDataSource')
dsdriver		= os.environ.get('DSDRIVER', 'oracle.jdbc.OracleDriver')
dsurl			= 'jdbc:oracle:thin:@//' + os.environ.get('DB_HOST', '10.0.105.114:3526:TPI3hx19')
dsusername		= os.environ.get('DS_USERNAME', 'tpprod')
dspassword		= os.environ.get('DS_PASSWORD', 'nineteen@19')

print ""
print "Start creating WebLogic datasource with below parameters:"
print('dsname        : [%s]' %  dsname);
print('dsdbname      : [%s]' %  dsdbname);
print('dsjndiname    : [%s]' %  dsjndiname);
print('dsdriver      : [%s]' %  dsdriver);
print('dsurl         : [%s]' %  dsurl);
print('dsusername    : [%s]' %  dsusername);
print('dspassword    : [%s]' %  dspassword);


# Open default domain template
# ============================
readTemplate("/u01/oracle/wlserver/common/templates/wls/wls.jar")

set('Name', domain_name)
setOption('DomainName', domain_name)

# Set Administration Port 
# =======================
if administration_port_enabled != "false":
   set('AdministrationPort', administration_port)
   set('AdministrationPortEnabled', 'true')

# Disable Admin Console
# --------------------
# cmo.setConsoleEnabled(false)

# Configure the Administration Server and SSL port.
# =================================================
cd('/Servers/AdminServer')
set('Name', admin_name)
set('ListenAddress', '')
set('ListenPort', admin_listen_port)
if administration_port_enabled != "false":
   create('AdminServer','SSL')
   cd('SSL/AdminServer')
   set('Enabled', 'True')

# Define the user password for weblogic
# =====================================
cd(('/Security/%s/User/weblogic') % domain_name)
cmo.setName(username)
cmo.setPassword(password)

# Write the domain and close the domain template
# ==============================================
setOption('OverwriteDomain', 'true')
setOption('ServerStartMode',production_mode)

# Write Domain
# ============
writeDomain(domain_path)
closeTemplate()

#####################################################################################
#import datasource config, get from https://github.com/oracle/docker-images
#path: OracleWebLogic/samples/1221-domain-with-resources/container-scripts/ds-deploy.py

# Read Domain in Offline Mode
# ===========================
readDomain(domain_path)  #change domainhome to domain_path

# Create Datasource
# ==================
create(dsname, 'JDBCSystemResource')
cd('/JDBCSystemResource/' + dsname + '/JdbcResource/' + dsname)
cmo.setName(dsname)

cd('/JDBCSystemResource/' + dsname + '/JdbcResource/' + dsname)
create('myJdbcDataSourceParams','JDBCDataSourceParams')
cd('JDBCDataSourceParams/NO_NAME_0')
set('JNDIName', java.lang.String(dsjndiname))
set('GlobalTransactionsProtocol', java.lang.String('None'))

cd('/JDBCSystemResource/' + dsname + '/JdbcResource/' + dsname)
create('myJdbcDriverParams','JDBCDriverParams')
cd('JDBCDriverParams/NO_NAME_0')
set('DriverName', dsdriver)
set('URL', dsurl)
set('PasswordEncrypted', dspassword)
set('UseXADataSourceInterface', 'false')

print 'create JDBCDriverParams Properties'
create('myProperties','Properties')
cd('Properties/NO_NAME_0')
create('user','Property')
cd('Property/user')
set('Value', dsusername)

cd('../../')
create('databaseName','Property')
cd('Property/databaseName')
set('Value', dsdbname)

print 'create JDBCConnectionPoolParams'
cd('/JDBCSystemResource/' + dsname + '/JdbcResource/' + dsname)
create('myJdbcConnectionPoolParams','JDBCConnectionPoolParams')
cd('JDBCConnectionPoolParams/NO_NAME_0')
set('TestTableName','SQL SELECT 1 FROM DUAL')

# Assign
# ======
assign('JDBCSystemResource', dsname, 'Target', admin_name)

# Update Domain, Close It, Exit
# ==========================
updateDomain()
closeDomain()

# Exit WLST
# =========
exit()
