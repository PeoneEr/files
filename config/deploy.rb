# config valid only for current version of Capistrano
lock '3.4.0'
set :application, 'files'
set :repo_url, 'git@github.com:PeoneEr/files.git'

set :deploy_to, '/home/deploy/files'

set :rails_env, "production"
set :db_local_clean, true
set :db_remote_clean, true

set :user, 'deploy'

set :linked_files, %w{config/database.yml config/settings.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
#set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}"  }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :add_default_hooks do
    after 'deploy:starting', 'sidekiq:quiet'
    after 'deploy:updated', 'sidekiq:stop'
    after 'deploy:reverted', 'sidekiq:stop'
    after 'deploy:published', 'sidekiq:start'
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

  after "deploy", "deploy:migrate"
end
