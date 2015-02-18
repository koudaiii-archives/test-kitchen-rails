require 'spec_helper'

# qt install
describe command('qmake -v') do
  let(:path){ '/opt/rh/qt48/root/usr/lib64/qt4/bin' }
  its(:stdout) { should eq /^QMake*/ }
end

# qt versions
describe command('qmake -v') do
  let(:path){ '/opt/rh/qt48/root/usr/lib64/qt4/bin' }
  its(:stdout) { should eq /4\.8\.4*/ }
end
