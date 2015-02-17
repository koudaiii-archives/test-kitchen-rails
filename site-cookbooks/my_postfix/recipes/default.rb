#
# Cookbook Name:: my_postfix
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postfix"

template "main.cf" do
  source "main.cf.erb"
  path "/etc/postfix/main.cf"
  mode 0644
  owner "root"
  group "root"
end
