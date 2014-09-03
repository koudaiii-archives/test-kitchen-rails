require 'spec_helper'

# rbenv install
describe command('rbenv -v') do
  let(:path){ '/usr/local/rbenv/bin' }
  it { should return_stdout /^rbenv*/ }
end

# ruby versions
describe command('ruby -v') do
  let(:path) { '/usr/local/rbenv/shims' }
  it { should return_stdout /ruby 2\.1\.2*/ }
end

# for gem packages
describe package('rbenv-rehash') do
  let(:path) { '/usr/local/rbenv/shims' }
  it { should be_installed.by('gem') }
end

describe package('bundler') do
  let(:path) { '/usr/local/rbenv/shims' }
  it { should be_installed.by('gem') }
end
