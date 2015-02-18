require 'spec_helper'

# locale
describe command('echo $LANG') do
  its(:stdout) { should eq /ja_JP\.UTF-8/ }
end
