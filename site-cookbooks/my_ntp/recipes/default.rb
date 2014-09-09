#
# Cookbook Name:: my_ntp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "ntp" do
  action :install
end
service "ntp_service" do
  service_name node[:ntp][:service]
  action [ :enable, :start ]
end

template "/etc/ntp.conf" do
  path "/etc/ntp.conf"
  source "ntp.conf.erb"
  variables( :ntp_server => "time.nist.gov" )
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[ntp_service]"
end
