#
# Cookbook Name:: my_mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "redhat", "centos", "amazon", "oracle"

  mysql_service 'default' do
    version   "#{node['my_mysql']['version']}"
    port      "#{node['my_mysql']['port']}"
    data_dir  "#{node['my_mysql']['data_dir']}"
    initial_root_password "#{node['my_mysql']['server_root_password']}"
    socket    "#{node['my_mysql']['socket']}"
    action [:create, :start]
  end

when "ubuntu", "debian"
  include_recipe 'apt::default'
  mysql_service 'default' do
    package_version "#{node['my_mysql']['server_package_version']}"
    version   "#{node['my_mysql']['version']}"
    action [:create, :start]
  end
end


mysql_client 'default' do
  action :create
end

mysql_config 'default' do
  source 'mysite.cnf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end
