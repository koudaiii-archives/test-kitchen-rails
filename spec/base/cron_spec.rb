require 'spec_helper'

# cron root
describe cron do
    it { should have_entry('PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/opt/rh/qt48/root/usr/lib64/qt4/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/koudaiii/bin').with_user('root') }
    it { should have_entry('* 4 * * * /bin/ls').with_user('root') }
end

# cron koudaiii
describe cron do
    it { should have_entry('PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/opt/rh/qt48/root/usr/lib64/qt4/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/koudaiii/bin').with_user('koudaiii') }
    it { should have_entry('* 3 * * * /bin/ls').with_user('koudaiii') }
end
