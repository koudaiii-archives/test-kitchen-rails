require 'spec_helper'

# ffmpeg install
describe command('ffmpeg -version') do
  let(:path){ '/usr/bin' }
  its(:stdout) { should eq /^ffmpeg*/ }
end
