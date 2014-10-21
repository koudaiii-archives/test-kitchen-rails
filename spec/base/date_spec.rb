require 'spec_helper'

# TimeZone 
describe command('date') do
  it(:stdout) { should eq /JST/ }
end
