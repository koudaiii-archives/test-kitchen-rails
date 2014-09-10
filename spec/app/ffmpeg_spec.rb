require 'spec_helper'

# ffmpeg install
describe command('ffmpeg -version') do
  let(:path){ '/usr/bin' }
  it { should return_stdout /^ffmpeg*/ }
end
