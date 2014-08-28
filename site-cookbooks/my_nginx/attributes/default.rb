default['my_nginx']['servername']       = node['hostname']
default['my_nginx']['worker_processes'] = node[:cpu][:total]
default['my_nginx']['default_root']     = '/var/www/'
default['my_nginx']['app']              = 'app'
