#
# Cookbook Name:: my-mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'mysql::server'
include_recipe 'mysql::client'

#template '/etc/mysql/conf.d/mysite.cnf' do
#    owner 'mysql'
#    owner 'mysql'
#    source 'mysite.cnf.erb'
#    notifies :restart, 'mysql_service[default]'
#end
