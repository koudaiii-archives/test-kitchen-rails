default['nginx']['server_name']      = node['hostname']
default['nginx']['worker_processes'] = node[:cpu][:total]
default['nginx']['dir']              = '/etc/nginx'
default['nginx']['log_dir']          = '/var/log/nginx'
default['nginx']['pid']              = '/var/run/nginx.pid'
