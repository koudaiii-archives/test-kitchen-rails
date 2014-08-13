#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "yum-epel"
include_recipe 'nginx::commons_dir'

package "nginx" do
  action :install
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

template "#{node['nginx']['dir']}/sites-available/default" do
  source 'default-site.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

## TODO site-enabled symboliclink
link "#{node['nginx']['dir']}/sites-enabled/default" do
  not_if do
    ::File.symlink?("#{node['nginx']['dir']}/sites-enabled/default") ||
    ::File.symlink?("#{node['nginx']['dir']}/sites-enabled/app")
  end
  to "#{node['nginx']['dir']}/sites-available/default"
  notifies :reload, 'service[nginx]'
end
