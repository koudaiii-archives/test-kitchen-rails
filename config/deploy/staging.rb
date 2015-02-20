# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.
host = ""
user = ""
keys = ""
port = ""

config = `vagrant ssh-config default`
if config != ''
  config.each_line do |line|
    if match = /HostName (.*)/.match(line)
      host = match[1]
    elsif  match = /User (.*)/.match(line)
      user = match[1]
    elsif match = /IdentityFile (.*)/.match(line)
      keys =  [match[1].gsub(/"/,'')]
    elsif match = /Port (.*)/.match(line)
      port = match[1]
    end
  end
end

ssh_login = "#{user}"+ "@" + "#{host}"

role :app, "#{ssh_login}"
role :web, "#{ssh_login}"
role :db,  "#{ssh_login}"


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server "#{host}", user: 'root', roles: %w{web app db}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
  set :ssh_options, {
    keys: "#{keys}",
    forward_agent: false,
    auth_methods: %w(password)
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
