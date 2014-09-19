require 'rake'
require 'rspec/core/rake_task'
require 'chef_zero/server'

task :spec => "spec:all"

namespace :spec do
  roles = %w( base web app db)
    task :all => roles

    roles.each do |role|
      RSpec::Core::RakeTask.new(role.to_sym) do |t|
        t.pattern = "spec/#{role}/*_spec.rb"
      end
    end
end

$stdin.sync = true

namespace :chefzero do
  desc 'chef-zero start_background'
  task :start do
  end
  desc 'chef-zero stop'
  task :stop do
  end
  desc 'upload chef-repos to chefzero vm'
  task :upload do
    system('bundle exec knife cookbook upload --all')
    system('bundle exec knife upload environments/ ')
    system('bundle exec knife upload roles/ ')
  end
end
