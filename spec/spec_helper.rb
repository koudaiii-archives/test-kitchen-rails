require 'serverspec'
require 'pathname'
require 'net/ssh'

set :backend, :exec

RSpec.configure do |c|
  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end
  config = `vagrant ssh-config default`
  if config != ''
    config.each_line do |line|
      if match = /HostName (.*)/.match(line)
        @host = match[1]
      elsif  match = /User (.*)/.match(line)
        @user = match[1]
      elsif match = /IdentityFile (.*)/.match(line)
        @keys =  [match[1].gsub(/"/,'')]
      elsif match = /Port (.*)/.match(line)
        @port = match[1]
      end
    end
  end
  set :host,@host
  set :ssh_options, :user => @user, port => @port
end
