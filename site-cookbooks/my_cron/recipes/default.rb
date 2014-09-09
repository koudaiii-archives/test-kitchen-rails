#
# Cookbook Name:: my_cron
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cron "app" do
  minute "*"
  hour "3"
  month "*"
  weekday "*"
  user "koudaiii"
  command "/bin/ls"
  path "/usr/local/rbenv/shims:/usr/local/rbenv/bin:/opt/rh/qt48/root/usr/lib64/qt4/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/koudaiii/bin"
end

cron "root" do
  minute "*"
  hour "4"
  month "*"
  weekday "*"
  user "root"
  command "/bin/ls"
  path "/usr/local/rbenv/shims:/usr/local/rbenv/bin:/opt/rh/qt48/root/usr/lib64/qt4/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/koudaiii/bin"
end

