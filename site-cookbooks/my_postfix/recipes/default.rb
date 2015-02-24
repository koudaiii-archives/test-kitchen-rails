#
# Cookbook Name:: my_postfix
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postfix"

case node[:platform]
when "redhat", "centos", "amazon", "oracle"
  package "mailx"
when "ubuntu"
end

template "main.cf" do
  source "main.cf.erb"
  path "/etc/postfix/main.cf"
  mode 0644
  owner "root"
  group "root"
end
