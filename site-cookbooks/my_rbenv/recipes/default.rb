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

case node[:platform]
when "ubuntu", "debian"
  include_recipe "apt"
end

package "curl"
package "curl-devel"

case node[:platform]
when "redhat", "centos", "amazon", "oracle"
  package "gcc"
  package "make"
  package "zlib"
  package "openssl"
  package "openssl-devel"
  package "zlib-devel"
  package "readline"
  package "readline-devel"
  package "libxml2-devel"
  package "libxslt-devel"
  package "gcc-c++"
  package "ImageMagick"
  package "ImageMagick-devel"
  package "mysql-devel"
  package "bzip2"
  package "libxml2"
  package "libxslt"
when "ubuntu", "debian"
  package "aptitude"
  package "libssl1.0.0"
  package "libc6-dev"
  package "automake"
  package "libtool"
  package 'libyaml-dev'
  package 'zlib1g'
  package 'zlib1g-dev'
  package "openssl"
  package 'libssl-dev'
  package "libreadline-dev"
  package "libxml2-dev"
  package "libxslt1-dev"
  package "ncurses-dev"
  package "pkg-config"
  package "build-essential"
  package "imagemagick"
  package "libmysqlclient"
  package "bzip2"
  package "zlib-devel"
  package "libxslt-dev"
  package "libxml2-dev"
  package "libqtwebkit-dev"
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
