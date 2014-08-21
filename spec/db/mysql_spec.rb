require 'spec_helper'

describe package('mysql') do
  it { should be_installed.with_version("5.1") }
end

describe service('mysqld') do
  it { should be_enabled   }
  it { should be_running   }
end


describe port(3306) do
  it { should be_listening }
end

describe file('/etc/my.cnf') do
  it { should be_file }
  its(:content) { should match /user=mysql/ }
end
