require 'spec_helper'

# TimeZone 
describe command('date') do
  its(:stdout) { should eq /JST/ }
end
