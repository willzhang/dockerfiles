# Set domain variables
admin_username   = os.environ.get('ADMIN_USERNAME', 'weblogic')
admin_password   = os.environ.get('ADMIN_PASSWORD', '88888888')
listen_address   = os.environ.get('LISTEN_ADDRESS', '0.0.0.0')
listen_port      = os.environ.get('LISTEN_PORT', '7001')

# Display domain variables	
print('admin_username : [%s]' % admin_username);
print('admin_password : [%s]' % admin_password);
print('listen_address : [%s]' % listen_address);
print('listen_port    : [%s]' % listen_port);

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
# Write the domain and close the domain template.
#=======================================================================================

setOption('OverwriteDomain', 'true')
writeDomain('/root/Oracle/Middleware/user_projects/domains/base_domain')
closeTemplate()

#=======================================================================================
# Exit WLST.
#=======================================================================================

exit()

