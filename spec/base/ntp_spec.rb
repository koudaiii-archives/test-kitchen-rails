require 'spec_helper'

# ntp running and enabled
describe service('ntpd') do
  it { should be_enabled }
  it { should be_running }
end

