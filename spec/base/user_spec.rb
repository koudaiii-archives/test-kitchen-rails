require 'spec_helper'

# koudaiii 
describe user('koudaiii') do
  it { should exist }
  it { should have_home_directory '/home/koudaiii' }
end
