require 'spec_helper'

# locale
describe command('echo "$LANG"') do
  it { should return_stdout /ja_JP\.UTF-8/ }
end
