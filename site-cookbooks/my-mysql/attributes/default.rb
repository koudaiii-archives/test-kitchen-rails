default['my-mysql']['service_name'] = node['hostname']
default['my-mysql']['server_root_password'] = 'password'
default['my-mysql']['server_debian_password'] = 'password'
default['my-mysql']['data_dir'] = '/var/lib/mysql'
default['my-mysql']['port'] = '3306'
default['my-mysql']['version'] = '5.6'

### used in grants.sql
default['my-mysql']['allow_remote_root'] = true
default['my-mysql']['remove_anonymous_users'] = true
default['my-mysql']['root_network_acl'] = nil
