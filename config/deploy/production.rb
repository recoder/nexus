# Change these
server '127.0.0.1', port: 22, roles: [:web, :app, :db], primary: true

# DON'T FORGET TO DO `echo 'deploy ALL=NOPASSWD:/usr/sbin/nginx' | sudo tee /etc/sudoers.d/deploy`

set :user,            'deploy'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :rails_env,       :production
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false  # Change to true if using ActiveRecord

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
set :env_file, ".env.#{fetch(:stage)}"
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/recoder`
        puts "WARNING: HEAD is not the same as origin/recoder"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Symlink environment'
  task :symlink_env do
    on roles(:app) do
      puts "Uploading '.env.production'..."
      upload! "/home/recoder/nexus/.env.production", "#{shared_path}/.env.production"
      execute "ln -nfs #{shared_path}/.env.production #{release_path}/.env.production"
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  before 'deploy:assets:precompile', :symlink_env

  before 'check:linked_files', 'puma:config'
#  before 'check:linked_files', 'puma:nginx_config'
#  after 'puma:smart_restart', 'nginx:restart'
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
