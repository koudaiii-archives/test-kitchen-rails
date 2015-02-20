# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

set :rails_env, 'production'

host = "192.168.33.10"
user = "root"
keys = "/User/koudaiii/.ssh/id_rsa"
port = "22"
default_password = "vagrant"

#config = `vagrant ssh-config default`
#
#if config != ''
#  config.each_line do |line|
#    if match = /HostName (.*)/.match(line)
#      unless "127\.0\.0\.1" == match[1]
#        host = match[1]
#      end
#    elsif match = /IdentityFile (.*)/.match(line)
#      keys =  [match[1].gsub(/"/,'')]
#    elsif match = /Port (.*)/.match(line)
#      if host == "127\.0\.0\.1"
#        port = match[1]
#      end
#    end
#  end
#end

ssh_login = "#{user}"+ "@" + "#{host}"

role :app, "#{ssh_login}"
role :web, "#{ssh_login}"
role :db,  "#{ssh_login}"


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server "#{host}", user: "#{user}", roles: %w{web app db}, my_property: :my_value

namespace :db do
  task :db_create do
    on roles(:db) do |host|
      execute :sudo,"mysql -uroot -ppassword -e 'CREATE DATABASE IF NOT EXISTS app_production;'"
    end
  end
end

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
set :ssh_options, {
  user: "#{user}",
  keys: %w("#{keys}"),
  forward_agent: false,
  port: "#{port}",
  auth_methods: %w(publickey password),
  password: "#{default_password}"
}

#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
