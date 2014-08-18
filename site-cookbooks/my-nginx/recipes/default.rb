#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform_family?('rhel')
  if node['nginx']['repo_source'] == 'epel'
    include_recipe 'yum-epel'
  elsif node['nginx']['repo_source'] == 'nginx'
    include_recipe 'nginx::repo'
    package_install_opts = '--disablerepo=* --enablerepo=nginx'
  elsif node['nginx']['repo_source'].nil?
    log "node['nginx']['repo_source'] was not set, no additional yum repositories will be installed." do
      level :debug
    end
  else
    fail ArgumentError, "Unknown value '#{node['nginx']['repo_source']}' was passed to the nginx cookbook."
  end
elsif platform_family?('debian')
  include_recipe 'nginx::repo' if node['nginx']['repo_source'] == 'nginx'
end

package node['nginx']['package_name'] do
  options package_install_opts
  notifies :reload, 'ohai[reload_nginx]', :immediately
  not_if 'which nginx'
end


service "nginx" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end

template 'nginx.conf' do
  path   "#{node['nginx']['dir']}/nginx.conf"
  source 'nginx.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

include_recipe 'nginx::commons_dir'
include_recipe 'my-nginx::sites'
