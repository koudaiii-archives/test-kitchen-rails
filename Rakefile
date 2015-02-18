require 'rake'
require 'rspec/core/rake_task'

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
