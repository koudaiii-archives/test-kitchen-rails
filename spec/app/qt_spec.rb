require 'spec_helper'

# qt install
describe command('qmake -v') do
  let(:path){ '/opt/rh/qt48/root/usr/lib64/qt4/bin' }
  it { should return_stdout /^QMake*/ }
end

# qt versions
describe command('qmake -v') do
  let(:path){ '/opt/rh/qt48/root/usr/lib64/qt4/bin' }
  it { should return_stdout /4\.8\.4*/ }
end
