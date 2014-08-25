default['mysql']['service_name'] = node['hostname']
default['mysql']['server_root_password'] = 'ilikerandompasswords'
default['mysql']['server_debian_password'] = 'postinstallscriptsarestupid'
default['mysql']['data_dir'] = '/var/lib/mysql'
default['mysql']['port'] = '3306'
default[:mysql][:version] = '5.6'

### used in grants.sql
default['mysql']['allow_remote_root'] = false
default['mysql']['remove_anonymous_users'] = true
default['mysql']['root_network_acl'] = nil
