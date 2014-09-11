#
# Cookbook Name:: my_repo
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "ubuntu", "debian"
  include_recipe 'apt'
end
case node[:platform]
when "redhat", "centos", "amazon", "oracle"
  include_recipe 'yum-epel'
end
