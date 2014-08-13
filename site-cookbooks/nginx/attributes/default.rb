default['nginx']['servername']       = node['hostname']
default['nginx']['worker_processes'] = node[:cpu][:total]
default['nginx']['default_root']     = '/var/www/'
default['nginx']['dir']              = '/etc/nginx'
default['nginx']['log_dir']          = '/var/log/nginx'
default['nginx']['pid']              = '/var/run/nginx.pid'
