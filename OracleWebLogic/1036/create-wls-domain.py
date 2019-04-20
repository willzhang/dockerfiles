import os
import random
import string
import socket

# Set domain variables
admin_username   = os.environ.get('ADMIN_USERNAME', 'weblogic')
admin_password   = os.environ.get('ADMIN_PASSWORD', '88888888')
listen_address   = os.environ.get('LISTEN_ADDRESS', '0.0.0.0')
listen_port      = os.environ.get('LISTEN_PORT', '7001')

# Set jdbc variables
ds_name       = os.environ.get('DATASOURCE_NAME', 'chinainsuranceDataSource')
ds_jndiname   = os.environ.get('JNDI_NAME', 'chinainsuranceDataSource')
ds_drivername = 'oracle.jdbc.xa.client.OracleXADataSource'
ds_username   = os.environ.get('DS_USERNAME', 'tpprod')
ds_password   = os.environ.get('DS_PASSWORD', 'nineteen@19')
ds_host       = os.environ.get('DS_HOST', '10.0.105.114:3526:TPI3hx19')
ds_url  = 'jdbc:oracle:thin:@' + ds_host

# Display domain variables	
print('admin_username : [%s]' % admin_username);
print('admin_password : [%s]' % admin_password);
print('listen_address : [%s]' % listen_address);
print('listen_port    : [%s]' % listen_port);

# Display jdbc variables
print('ds_name       : [%s]' %  ds_name);
print('ds_jndiname   : [%s]' %  ds_jndiname);
print('ds_drivername : [%s]' %  ds_drivername);
print('ds_username   : [%s]' %  ds_username);
print('ds_password   : [%s]' %  ds_password);
print('ds_host       : [%s]' %  ds_host);
print('ds_url        : [%s]' %  ds_url);

#=======================================================================================
# Open a domain template.
#=======================================================================================

readTemplate("/root/Oracle/Middleware/wlserver_10.3/common/templates/domains/wls.jar")

#=======================================================================================
# Configure the Administration Server
#=======================================================================================

cd('Servers/AdminServer')
cmo.setListenPort(int(listen_port))
cmo.setListenAddress(listen_address)

#=======================================================================================
# Define the user password for weblogic.
#=======================================================================================

cd('/')
cd('Security/base_domain/User/' + admin_username)
cmo.setPassword(admin_password)

#=======================================================================================
# Create and configure a JDBC Data Source, and sets the JDBC user.
#=======================================================================================

cd('/')
create(ds_name, 'JDBCSystemResource')

cd('/JDBCSystemResource/' + ds_name + '/JdbcResource/' + ds_name)
create('myJdbcDriverParams','JDBCDriverParams')

cd('JDBCDriverParams/NO_NAME_0')
cmo.setUrl(ds_url)
cmo.setDriverName(ds_drivername)

set('PasswordEncrypted', ds_password)
set('UseXADataSourceInterface', 'true')
create('myProps','Properties')

cd('Properties/NO_NAME_0')
create('user', 'Property')

cd('Property/user')
cmo.setValue(ds_username)

cd('/JDBCSystemResource/' + ds_name + '/JdbcResource/' + ds_name)
create('myJdbcDataSourceParams','JDBCDataSourceParams')

cd('JDBCDataSourceParams/NO_NAME_0')
set('JNDIName', java.lang.String(ds_jndiname))

cd('/JDBCSystemResource/' + ds_name + '/JdbcResource/' + ds_name)
create('myJdbcConnectionPoolParams','JDBCConnectionPoolParams')
cd('JDBCConnectionPoolParams/NO_NAME_0')
set('TestTableName','SQL SELECT 1 FROM DUAL\r\n\r\n')

#=======================================================================================
# Target resources to the servers. 
#=======================================================================================

cd('/')
assign('JDBCSystemResource', ds_name, 'Target', 'AdminServer')

#=======================================================================================
# Write the domain and close the domain template.
#=======================================================================================

setOption('OverwriteDomain', 'true')
writeDomain('/root/Oracle/Middleware/user_projects/domains/base_domain')
closeTemplate()

#=======================================================================================
# Exit WLST.
#=======================================================================================

exit()

