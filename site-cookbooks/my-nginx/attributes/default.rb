default['my-nginx']['servername']       = node['hostname']
default['my-nginx']['worker_processes'] = node[:cpu][:total]
default['my-nginx']['default_root']     = '/var/www/'
default['my-nginx']['app']              = 'app'
