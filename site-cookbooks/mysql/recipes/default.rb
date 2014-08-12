#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "mysql-server" do
  action :install
end

service "mysqld" do
  action [ :enable, :start]
  supports :status => true, :restart => true, :reload => true
end

template "my.cnf" do
  path "/etc/my.cnf"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[mysqld]'
end
