#
# Cookbook Name:: login_users
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag('users')

data_ids.each do |id|
  u = data_bag_item('users', id)
  user u['username'] do
    supports :manage_home => true
    home u['home']
    shell u['shell']
    password u['password']
    system u['system']
    action :create
  end

  # .sshディレクトリを作ります
  directory "#{u['home']}/.ssh" do
    owner u['username']
    group u['username']
    action :create
  end

  # authorized_keysファイルを作ります
  authorized_keys_file ="#{u['home']}/.ssh/authorized_keys"

  if u['ssh_keys'] == "public_key"
    #file authorized_keys_file do
    cookbook_file authorized_keys_file do
      owner u['username']
      mode  0600
      #content u['ssh_keys']
      not_if { ::File.exists?("#{authorized_keys_file}")}
    end
  elsif
    file authorized_keys_file do
      owner u['username']
      mode  0600
      content u['ssh_keys']
      not_if { ::File.exists?("#{authorized_keys_file}")}
    end
  end
end

include_recipe 'sudo'
