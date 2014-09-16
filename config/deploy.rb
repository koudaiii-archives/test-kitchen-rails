# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'app'
set :repo_url, 'https://github.com/koudaiii/twitter-bootswatch-rails-demo.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/app'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system uploads jmaxml}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  Rake::Task["deploy:check:directories"].clear
  namespace :check do
    desc '(overwrite) Check shared and release directories exist'
    task :directories do
      on release_roles :all do
        execute :sudo, :mkdir, '-pv', shared_path, releases_path, "#{shared_path}/config", "#{shared_path}/uploads", "#{shared_path}/jmaxml"
      end
    end
  end

  task :fix_permissions do
    on release_roles :all do
      execute :sudo, :chown, '-R', "deploy:deploy", deploy_to
    end
  end

  desc 'Upload config!(local to host)'
  task :upload do
    on roles(:app) do |host|
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
    end
  end

  desc 'Create Database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  before :starting, 'deploy:fix_permissions'
  before :starting, 'deploy:upload'
  after :publishing, :restart


  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
