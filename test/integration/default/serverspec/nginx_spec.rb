require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe package('nginx') do
  it { should be_installed.with_version("1.6.1")}
end

describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end


describe port(80) do
  it { should be_listening }
end

describe file('/etc/nginx/sites-enabled/app') do
  it { should be_file }
  its(:content) { should match /server_name webapp/ }
end
