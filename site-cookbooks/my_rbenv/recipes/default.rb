#
# Cookbook Name:: my_rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

%w{git openssl-devel sqlite-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

#TODO
#directory "/usr/local/rbenv" do
#  owner node["my_rbenv"]["user"]
#  group node["my_rbenv"]["group"]
#  mode 0755
#  action :create
#end

git "/usr/local/rbenv" do
  repository node["my_rbenv"]["my_rbenv_url"]
  action :sync
#  user node["my_rbenv"]["user"]
#  group node["my_rbenv"]["group"]
end

#TODO
%w{plugins shims versions}.each do |dir|
  directory "/usr/local/rbenv/#{dir}" do
    owner "root"
    group "root"
    mode 0777
    action :create
  end
end

git "/usr/local/rbenv/plugins/ruby-build" do
  repository node["my_rbenv"]["ruby-build_url"]
  action :sync
  user "root"
  group "root"
end

template "rbenv.sh" do
  source "rbenv.sh.erb"
  path "/etc/profile.d/rbenv.sh"
  mode 0644
  owner "root"
  group "root"
  not_if "grep rbenv /etc/profile.d/rbenv.sh"
end

include_recipe 'my_rbenv::ruby_install'
