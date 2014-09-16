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
    home u['home']
    shell u['shell']
    password u['password']
    system u['system']
  end

  # .sshディレクトリを作ります
  directory "#{u['home']}/.ssh" do
    owner u['username']
    group u['username']
  end

  # authorized_keysファイルを作ります
  authorized_keys_file ="#{u['home']}/.ssh/authorized_keys"
  #file authorized_keys_file do
  cookbook_file authorized_keys_file do
    owner u['username']
    mode  0600
    #content u['ssh_keys']
    not_if { ::File.exists?("#{authorized_keys_file}")}
  end
end

include_recipe 'sudo'
