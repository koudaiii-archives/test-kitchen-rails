#
# Cookbook Name:: my_ffmpeg
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "ubuntu", "debian"
  if node['lsb']['codename'] == "trusty"
    template "ffmpeg.list" do
      source "ffmpeg.list.erb"
      path   "/etc/apt/sources.list.d/ffmpeg.list"
    end
    execute "apt-get update"
    package "ffmpeg" do
      action :install
      options "--force-yes"
    end
  else
    include_recipe 'ffmpeg'
  end
end
case node[:platform]
when "redhat", "centos", "amazon", "oracle"

  remote_file "#{Chef::Config[:file_cache_path]}/atrpms-repo-6-7.el6.x86_64.rpm" do
    source "http://dl.atrpms.net/el6-x86_64/atrpms/stable/atrpms-repo-6-7.el6.x86_64.rpm"
    action :create
  end

  rpm_package "atrpms-repo-6-7.el6.x86_64.rpm" do
    source "#{Chef::Config[:file_cache_path]}/atrpms-repo-6-7.el6.x86_64.rpm"
    action :install
  end

  execute "yum-update" do
    user "root"
    command "yum -y update"
    action :run
  end

  package "ffmpeg"
  package "ffmpeg-devel"

end
