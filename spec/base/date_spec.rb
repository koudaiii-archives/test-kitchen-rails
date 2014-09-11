require 'spec_helper'

# TimeZone 
describe command('date') do
  it { should return_stdout /JST/ }
end
