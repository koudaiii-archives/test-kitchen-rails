#
# Cookbook Name:: my_qt
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "ubuntu", "debian"
  package "libqtwebkit-dev"
end

case node[:platform]
when "redhat", "centos", "amazon", "oracle"
  package "qt-devel"

  template '/etc/yum.repos.d/qt48.repo' do
    source 'qt48.repo.erb'
  end

  execute "yum-update" do
    user "root"
    command "yum -y update"
    action :run
  end

  package "qt48-qt-webkit-devel"

  link "/opt/rh/qt48/root/usr/include/QtCore/qconfig-x86_64.h" do
    to "/opt/rh/qt48/root/usr/include/QtCore/qconfig-64.h"
    link_type :symbolic
  end

  link "/etc/profile.d/enable" do
    to "/opt/rh/qt48/enable"
    link_type :symbolic
  end

  template "/etc/profile.d/qt.sh" do
    source "qt.sh.erb"
  end

  execute "run_updated_bash" do
      command "bash /etc/profile.d/qt.sh"
  end
end
