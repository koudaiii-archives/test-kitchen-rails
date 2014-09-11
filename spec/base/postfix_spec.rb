require 'spec_helper'

# postfix running and enabled
describe service('postfix') do
  it { should be_enabled }
  it { should be_running }
end

