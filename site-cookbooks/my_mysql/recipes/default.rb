#
# Cookbook Name:: my_mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_service 'default' do
  version   "#{node['my_mysql']['version']}"
  port      "#{node['my_mysql']['port']}"
  data_dir  "#{node['my_mysql']['data_dir']}"
  initial_root_password "#{node['my_mysql']['server_root_password']}"
  action :create
end

mysql_client 'default' do
  action :create
end

mysql_config 'default' do
  source 'mysite.cnf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end
