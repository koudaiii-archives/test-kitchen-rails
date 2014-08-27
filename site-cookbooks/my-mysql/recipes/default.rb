#
# Cookbook Name:: my-mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#node.set['mysql']['server_root_password']   = "#{node['my-mysql']['server_root_password']}"
#node.set['mysql']['data_dir']               = "#{node['my-mysql']['data_dir']}"
#node.set['mysql']['sercive_name']           = "#{node['my-mysql']['service_name']}"
#node.set['mysql']['server_debian_password'] = "#{node['my-mysql']['server_debian_password']}"
#node.set['mysql']['port']                   = "#{node['my-mysql']['port']}"
#node.set['mysql']['version']                = "#{node['my-mysql']['version']}"
#
#node.set['mysql']['allow_remote_root']      = "#{node['my-mysql']['allow_remote_root']}"
#node.set['mysql']['remove_anonymous_users'] = "#{node['my-mysql']['remove_anonymous_users']}"
#node.set['mysql']['root_network_acl']       = "#{node['my-mysql']['root_network_acl']}"

mysql_service 'default' do
  version   "#{node['my-mysql']['version']}"
  port      "#{node['my-mysql']['port']}"
  data_dir  "#{node['my-mysql']['data_dir']}"
  allow_remote_root true
  root_network_acl node['my-mysql']['root_network_acl']
  remove_anonymous_users node['my-mysql']['remove_anonymous_users']
  remove_test_database  false
  server_root_password "#{node['my-mysql']['server_root_password']}"
  server_repl_password "#{node['my-mysql']['server_debian_password']}"
  server_debian_password "#{node['my-mysql']['server_debian_password']}"
  action :create
end

#service "mysql" do
#  action [ :enable, :start ]
#  supports :status => true, :restart => true, :reload => true
#end


include_recipe 'mysql::client'

#template '/etc/mysql/conf.d/mysite.cnf' do
#    owner 'mysql'
#    owner 'mysql'
#    source 'mysite.cnf.erb'
#    notifies :restart, 'mysql_service[default]'
#end
